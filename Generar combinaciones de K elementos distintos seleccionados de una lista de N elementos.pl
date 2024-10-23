% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
% Generar combinaciones de K elementos distintos
% seleccionados de una lista de N elementos.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%----------codigo C#-------------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Lista de elementos
        List<int> elementos = new List<int> { 1, 2, 3, 4, 5 };
        int k = 3; // Número de elementos en cada combinación

        Console.WriteLine($"Combinaciones de {k} elementos de la lista:");
        GenerarCombinaciones(elementos, k);
    }

    static void GenerarCombinaciones(List<int> elementos, int k)
    {
        List<int> combinacion = new List<int>();
        CombinacionesRecursivas(elementos, k, 0, combinacion);
    }

    static void CombinacionesRecursivas(List<int> elementos, int k, int startIndex, List<int> combinacion)
    {
        // Si la combinación actual tiene k elementos, imprímela
        if (combinacion.Count == k)
        {
            Console.WriteLine($"[{string.Join(", ", combinacion)}]");
            return;
        }

        // Generar combinaciones recursivamente
        for (int i = startIndex; i < elementos.Count; i++)
        {
            // Agregar el elemento actual a la combinación
            combinacion.Add(elementos[i]);

            // Llamada recursiva para completar la combinación
            CombinacionesRecursivas(elementos, k, i + 1, combinacion);

            // Eliminar el último elemento agregado para volver atrás
            combinacion.RemoveAt(combinacion.Count - 1);
        }
    }
}

%------------------codigo de prolog---------------------
% Predicado principal para generar combinaciones
combinaciones(_, 0, []). % Caso base: combinaciones de 0 elementos
combinaciones(Lista, K, [Elem|Comb]) :-
    K > 0,                % Asegurarse de que K sea mayor que 0
    select(Elem, Lista, Resto), % Selecciona un elemento y obtiene el resto
    K1 is K - 1,          % Disminuir K
    combinaciones(Resto, K1, Comb). % Llamada recursiva con el resto

% Ejemplo de uso
ejemplo :-
    Lista = [1, 2, 3, 4, 5],
    K = 3,
    write('Combinaciones de '), write(K), write(' elementos:'), nl,
    combinaciones(Lista, K, Comb),
    write(Comb), nl,
    fail. % Hacer backtracking para encontrar todas las combinaciones

ejemplo :- % Se debe definir un segundo predicado ejemplo para terminar la ejecución
    write('Fin de las combinaciones.'), nl.
