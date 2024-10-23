% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que Agrupae 
%   los elementos de un conjunto en subconjuntos
%                                   disjuntos.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%----------------Codigo en c#------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Conjunto de entrada
        List<int> conjunto = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };

        // Tamaño de los subconjuntos
        int tamañoSubconjunto = 3;

        // Obtener los subconjuntos
        List<List<int>> subconjuntos = AgruparEnSubconjuntos(conjunto, tamañoSubconjunto);

        // Mostrar los resultados
        Console.WriteLine("Subconjuntos disjuntos:");
        foreach (var subconjunto in subconjuntos)
        {
            Console.WriteLine("[" + string.Join(", ", subconjunto) + "]");
        }
    }

    static List<List<int>> AgruparEnSubconjuntos(List<int> conjunto, int tamañoSubconjunto)
    {
        List<List<int>> subconjuntos = new List<List<int>>();
        for (int i = 0; i < conjunto.Count; i += tamañoSubconjunto)
        {
            // Obtener el subconjunto
            List<int> subconjunto = conjunto.GetRange(i, Math.Min(tamañoSubconjunto, conjunto.Count - i));
            subconjuntos.Add(subconjunto);
        }
        return subconjuntos;
    }
}


%------------------Codigo en prolog----------------------
% dividir_lista(Lista, Tamaño, Subconjuntos)
dividir_lista([], _, []). % Caso base: si la lista está vacía, no hay subconjuntos
dividir_lista(Lista, Tamaño, [Subconjunto|Subconjuntos]) :-
    length(Subconjunto, Tamaño),           % Crear un subconjunto de tamaño especificado
    append(Subconjunto, Resto, Lista),     % Dividir la lista en un subconjunto y el resto
    dividir_lista(Resto, Tamaño, Subconjuntos). % Recursión para el resto

% ejemplo de uso
:- initialization(main).
main :-
    Lista = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    Tamaño = 3,
    dividir_lista(Lista, Tamaño, Subconjuntos),
    write('Subconjuntos disjuntos: '), nl,
    imprimir_subconjuntos(Subconjuntos).

% imprimir_subconjuntos(Subconjuntos)
imprimir_subconjuntos([]). % Caso base: no hay más subconjuntos que imprimir
imprimir_subconjuntos([Subconjunto|Resto]) :-
    write('['), write(Subconjunto), write(']'), nl,
    imprimir_subconjuntos(Resto). % Recursión para imprimir el resto
