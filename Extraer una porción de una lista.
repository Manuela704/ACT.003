
% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Extraer una porción de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%--------------Codigo c#-------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Lista de ejemplo
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };

        int inicio = 3; // Índice de inicio (0 basado)
        int cantidad = 4; // Cantidad de elementos a extraer

        Console.WriteLine("Lista original:");
        Console.WriteLine($"[{string.Join(", ", lista)}]");

        List<int> porcion = ExtraerPorcion(lista, inicio, cantidad);

        Console.WriteLine($"Porción extraída desde el índice {inicio} con cantidad {cantidad}:");
        Console.WriteLine($"[{string.Join(", ", porcion)}]");
    }

    static List<int> ExtraerPorcion(List<int> lista, int inicio, int cantidad)
    {
        // Asegurarse de que el índice y la cantidad sean válidos
        if (inicio < 0 || cantidad < 0 || inicio + cantidad > lista.Count)
        {
            throw new ArgumentOutOfRangeException("Índice o cantidad fuera de los límites de la lista.");
        }

        return lista.GetRange(inicio, cantidad);
    }
}


%------------Codigo prolog------------------
% Predicado para extraer una porción de la lista
extraer_porcion(Lista, Inicio, Cantidad, Porcion) :-
    Inicio >= 0,                    % Asegurarse de que el índice de inicio sea válido
    extraer_porcion_aux(Lista, Inicio, Cantidad, Porcion).

% Caso base: si la cantidad es 0, la porción es una lista vacía
extraer_porcion_aux(_, 0, 0, []). 
extraer_porcion_aux([], _, _, []) :- !. % Si la lista original está vacía, retornar lista vacía
extraer_porcion_aux([H|T], Inicio, Cantidad, [H|Porcion]) :-
    Inicio > 0,                     % Si el índice de inicio es mayor que 0, ignorar el elemento
    N1 is Inicio - 1,               % Decrementar el índice de inicio
    extraer_porcion_aux(T, N1, Cantidad, Porcion). % Continuar con la cola
extraer_porcion_aux([H|T], 0, Cantidad, [H|Porcion]) :-
    Cantidad > 0,                   % Si todavía hay cantidad de elementos a extraer
    N1 is Cantidad - 1,             % Decrementar la cantidad
    extraer_porcion_aux(T, 0, N1, Porcion). % Continuar extrayendo de la cola

% Ejemplo de uso
ejemplo :-
    Lista = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    Inicio = 3,
    Cantidad = 4,
    write('Lista original: '), write(Lista), nl,
    extraer_porcion(Lista, Inicio, Cantidad, Porcion),
    write('Porción extraída desde el índice '), write(Inicio),
    write(' con cantidad '), write(Cantidad), write(': '),
    write(Porcion), nl.





