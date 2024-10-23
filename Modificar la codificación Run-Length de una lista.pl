% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
% Modificar la codificación Run-Length de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%--------------Codigo c#--------------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Lista de ejemplo
        List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'c', 'd', 'd', 'd', 'd', 'e' };

        Console.WriteLine("Lista original:");
        Console.WriteLine($"[{string.Join(", ", lista)}]");

        var codificada = CodificarRLE(lista);
        Console.WriteLine("Lista codificada (Run-Length):");
        Console.WriteLine($"[{string.Join(", ", codificada)}]");

        var decodificada = DecodificarRLE(codificada);
        Console.WriteLine("Lista decodificada:");
        Console.WriteLine($"[{string.Join(", ", decodificada)}]");
    }

    // Método para codificar la lista usando Run-Length Encoding
    static List<string> CodificarRLE(List<char> lista)
    {
        List<string> resultado = new List<string>();

        if (lista.Count == 0) return resultado; // Retornar lista vacía si la entrada es vacía

        char caracterActual = lista[0];
        int contador = 1;

        for (int i = 1; i < lista.Count; i++)
        {
            if (lista[i] == caracterActual)
            {
                contador++;
            }
            else
            {
                resultado.Add($"{contador}{caracterActual}");
                caracterActual = lista[i];
                contador = 1;
            }
        }
        resultado.Add($"{contador}{caracterActual}"); // Agregar el último grupo

        return resultado;
    }

    // Método para decodificar la lista usando Run-Length Encoding
    static List<char> DecodificarRLE(List<string> codificada)
    {
        List<char> resultado = new List<char>();

        foreach (var item in codificada)
        {
            int contador = int.Parse(item[0].ToString()); // Obtener el número de repeticiones
            char caracter = item[1]; // Obtener el carácter

            for (int i = 0; i < contador; i++)
            {
                resultado.Add(caracter);
            }
        }

        return resultado;
    }
}


%------------------------CODIGO PROLOG--------------------
% Predicado para codificar una lista usando Run-Length Encoding
codificar_rle([], []).  % Caso base: lista vacía
codificar_rle([H|T], Codificada) :-
    contar_repetidos([H|T], H, 1, Cuenta, Resto),  % Contar elementos repetidos
    atom_concat(Cuenta, H, Codificado),            % Formar la representación RLE
    codificar_rle(Resto, CodificadaResto),         % Codificar el resto
    append([Codificado], CodificadaResto, Codificada). % Combinar resultados

% Contar los elementos repetidos
contar_repetidos([], _, Cuenta, Cuenta, []).  % Cuando no hay más elementos
contar_repetidos([H|T], H, CuentaActual, CuentaFinal, Resto) :-
    NuevaCuenta is CuentaActual + 1,               % Incrementar el contador
    contar_repetidos(T, H, NuevaCuenta, CuentaFinal, Resto). % Continuar contando
contar_repetidos([H|T], Elemento, Cuenta, Cuenta, [H|T]) :- 
    H \= Elemento.                                   % Cuando se encuentra un elemento diferente

% Predicado para decodificar una lista usando Run-Length Encoding
decodificar_rle([], []).  % Caso base: lista vacía
decodificar_rle([H|T], Decodificada) :-
    atom_chars(H, [C1, C2]),                       % Descomponer el elemento codificado
    atom_number(C1, Cuenta),                       % Obtener la cuenta
    decodificar_elem(Cuenta, C2, ParteDecodificada), % Decodificar el elemento
    decodificar_rle(T, DecodificadaResto),        % Decodificar el resto
    append(ParteDecodificada, DecodificadaResto, Decodificada). % Combinar resultados

% Repetir el carácter según la cuenta
decodificar_elem(0, _, []).  % No repetir si la cuenta es 0
decodificar_elem(Cuenta, Char, [Char|Resto]) :-
    NuevaCuenta is Cuenta - 1,                     % Decrementar la cuenta
    decodificar_elem(NuevaCuenta, Char, Resto).    % Repetir el carácter

% Ejemplo de uso
ejemplo :-
    Lista = [a, a, b, c, c, c, d, d, d, d, e],
    write('Lista original: '), write(Lista), nl,
    codificar_rle(Lista, Codificada),
    write('Lista codificada (Run-Length): '), write(Codificada), nl,
    decodificar_rle(Codificada, Decodificada),
    write('Lista decodificada: '), write(Decodificada), nl.
