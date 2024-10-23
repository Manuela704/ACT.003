
% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
% Rotar una lista un número N de lugares a la izquierda.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%------------Codigo c#--------------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Lista de ejemplo
        List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
        int n = 2; // Número de posiciones a rotar

        Console.WriteLine("Lista original:");
        Console.WriteLine($"[{string.Join(", ", lista)}]");

        List<int> listaRotada = RotarIzquierda(lista, n);

        Console.WriteLine($"Lista rotada a la izquierda {n} lugares:");
        Console.WriteLine($"[{string.Join(", ", listaRotada)}]");
    }

    static List<int> RotarIzquierda(List<int> lista, int n)
    {
        int count = lista.Count;

        // Asegurarse de que N no sea mayor que la longitud de la lista
        n = n % count;
        
        // Si n es 0, no hay que rotar
        if (n == 0) return lista;

        // Obtener la parte que se moverá al final
        List<int> parteIzquierda = lista.GetRange(n, count - n);
        List<int> parteDerecha = lista.GetRange(0, n);

        // Concatenar las partes
        parteIzquierda.AddRange(parteDerecha);

        return parteIzquierda;
    }
}

%---------------Codigo prolog-----------------------
% Predicado para rotar la lista N lugares a la izquierda
rotar_lista([], _, []). % Caso base: lista vacía
rotar_lista(Lista, 0, Lista). % Si N es 0, la lista no cambia
rotar_lista([H|T], N, Rotada) :-
    N > 0,
    append(T, [H], NuevaLista), % Mover el primer elemento al final
    N1 is N - 1,                % Disminuir N
    rotar_lista(NuevaLista, N1, Rotada). % Llamada recursiva

% Ejemplo de uso
ejemplo :-
    Lista = [1, 2, 3, 4, 5],
    N = 2,
    write('Lista original: '), write(Lista), nl,
    rotar_lista(Lista, N, Rotada),
    write('Lista rotada a la izquierda '), write(N), write(' lugares: '), write(Rotada), nl.







