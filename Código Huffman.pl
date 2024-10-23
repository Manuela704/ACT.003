% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Código Huffman.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%------------------Codigo c#--------------------
using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    // Nodo para el árbol de Huffman
    public class Nodo
    {
        public char Caracter;
        public int Frecuencia;
        public Nodo Izquierda;
        public Nodo Derecha;

        public Nodo(char caracter, int frecuencia)
        {
            Caracter = caracter;
            Frecuencia = frecuencia;
        }
    }

    // Comparador para ordenar los nodos por frecuencia
    public class Comparador : IComparer<Nodo>
    {
        public int Compare(Nodo x, Nodo y)
        {
            return x.Frecuencia - y.Frecuencia;
        }
    }

    // Método principal
    static void Main()
    {
        string texto = "ejemplo de texto para compresión Huffman";
        Console.WriteLine("Texto original: " + texto);
        
        // Generar el árbol de Huffman y obtener el código
        var codigoHuffman = GenerarCodigoHuffman(texto);

        Console.WriteLine("Código Huffman:");
        foreach (var par in codigoHuffman)
        {
            Console.WriteLine($"Caracter: '{par.Key}' - Código: {par.Value}");
        }

        // Codificar el texto
        string textoCodificado = CodificarTexto(texto, codigoHuffman);
        Console.WriteLine("Texto codificado: " + textoCodificado);
    }

    // Genera el código Huffman para el texto dado
    static Dictionary<char, string> GenerarCodigoHuffman(string texto)
    {
        var frecuencias = ObtenerFrecuencias(texto);
        var nodos = new PriorityQueue<Nodo, int>();

        // Crear nodos para cada caracter y agregarlos a la cola de prioridad
        foreach (var par in frecuencias)
        {
            nodos.Enqueue(new Nodo(par.Key, par.Value), par.Value);
        }

        // Construir el árbol de Huffman
        while (nodos.Count > 1)
        {
            var nodoIzquierdo = nodos.Dequeue();
            var nodoDerecho = nodos.Dequeue();
            var nodoPadre = new Nodo('\0', nodoIzquierdo.Frecuencia + nodoDerecho.Frecuencia)
            {
                Izquierda = nodoIzquierdo,
                Derecha = nodoDerecho
            };
            nodos.Enqueue(nodoPadre, nodoPadre.Frecuencia);
        }

        // Generar el código para cada caracter
        var codigoHuffman = new Dictionary<char, string>();
        GenerarCodigo(nodos.Peek(), "", codigoHuffman);
        return codigoHuffman;
    }

    // Obtener frecuencias de cada caracter en el texto
    static Dictionary<char, int> ObtenerFrecuencias(string texto)
    {
        var frecuencias = new Dictionary<char, int>();
        foreach (var caracter in texto)
        {
            if (frecuencias.ContainsKey(caracter))
                frecuencias[caracter]++;
            else
                frecuencias[caracter] = 1;
        }
        return frecuencias;
    }

    // Generar el código para cada caracter
    static void GenerarCodigo(Nodo nodo, string codigo, Dictionary<char, string> codigoHuffman)
    {
        if (nodo.Izquierda == null && nodo.Derecha == null)
        {
            codigoHuffman[nodo.Caracter] = codigo;
            return;
        }
        GenerarCodigo(nodo.Izquierda, codigo + "0", codigoHuffman);
        GenerarCodigo(nodo.Derecha, codigo + "1", codigoHuffman);
    }

    // Codificar el texto utilizando el código Huffman
    static string CodificarTexto(string texto, Dictionary<char, string> codigoHuffman)
    {
        string textoCodificado = "";
        foreach (var caracter in texto)
        {
            textoCodificado += codigoHuffman[caracter];
        }
        return textoCodificado;
    }
}


%---------------Codigo en prolog -------------------------
:- dynamic huffman_tree/2.

% Definición de un nodo del árbol
node(Char, Freq, Left, Right).

% Genera la tabla de frecuencias de los caracteres
frequencies(Text, FreqList) :-
    string_codes(Text, Codes),
    frequencies_helper(Codes, FreqList).

frequencies_helper([], []).
frequencies_helper([H|T], [node(H, Freq)|FreqList]) :-
    include(=(H), T, Matches),
    length(Matches, Count),
    Freq is Count + 1,
    frequencies_helper(T, FreqList1),
    exclude(=(H), FreqList1, FreqList).

% Construye el árbol de Huffman
build_huffman_tree(FreqList, Tree) :-
    findall(node(Char, Freq), member(node(Char, Freq), FreqList), Nodes),
    build_tree(Nodes, Tree).

build_tree([Node] , Node). % Si solo hay un nodo, este es el árbol
build_tree(Nodes, Tree) :-
    % Ordenar los nodos por frecuencia
    sort(2, @=<, Nodes, SortedNodes),
    SortedNodes = [Left, Right | Rest],
    % Crear un nuevo nodo que combine los dos nodos con menor frecuencia
    Left = node(Char1, Freq1),
    Right = node(Char2, Freq2),
    NewFreq is Freq1 + Freq2,
    NewNode = node('\0', NewFreq, Left, Right),
    % Construir el nuevo árbol
    build_tree([NewNode | Rest], Tree).

% Generar el código Huffman
generate_codes(Tree, Codes) :-
    generate_codes_helper(Tree, "", Codes).

generate_codes_helper(node(Char, _, Left, Right), Prefix, [Char-Code|Codes]) :-
    atom(Char), !,
    atom_concat(Prefix, '0', NewPrefix0),
    generate_codes_helper(Left, NewPrefix0, Codes1),
    atom_concat(Prefix, '1', NewPrefix1),
    generate_codes_helper(Right, NewPrefix1, Codes2),
    append(Codes1, Codes2, Codes).
generate_codes_helper(node(_, _, Left, Right), Prefix, Codes) :-
    generate_codes_helper(Left, Prefix, Codes1),
    generate_codes_helper(Right, Prefix, Codes2),
    append(Codes1, Codes2, Codes).

% Codificar el texto usando el árbol de Huffman
huffman_encode(Text, Encoded) :-
    frequencies(Text, FreqList),
    build_huffman_tree(FreqList, Tree),
    generate_codes(Tree, Codes),
    huffman_encode_helper(Text, Codes, Encoded).

huffman_encode_helper([], _, []).
huffman_encode_helper([H|T], Codes, Encoded) :-
    member(Char-Code, Codes),
    Char = H,
    huffman_encode_helper(T, Codes, RestEncoded),
    append(Code, RestEncoded, Encoded).

% Decodificar el texto codificado
huffman_decode([], _, []).
huffman_decode(Encoded, Tree, [Char|Decoded]) :-
    decode_char(Encoded, Tree, RestEncoded, Char),
    huffman_decode(RestEncoded, Tree, Decoded).

decode_char([], _, [], _) :- !, fail.
decode_char([0|T], node(Char, _, Left, Right), Rest, Char) :-
    decode_char(T, Left, Rest, Char), !.
decode_char([1|T], node(Char, _, Left, Right), Rest, Char) :-
    decode_char(T, Right, Rest, Char), !.

% Predicado principal para codificar y decodificar
huffman(Text, Encoded, Decoded) :-
    huffman_encode(Text, Encoded),
    frequencies(Text, FreqList),
    build_huffman_tree(FreqList, Tree),
    huffman_decode(Encoded, Tree, Decoded).

%Ejemplo de uso 
Para usar este código en un intérprete Prolog, puedes hacer lo siguiente:
?- huffman("ejemplo de texto para compresión Huffman", Encoded, Decoded).
