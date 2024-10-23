
% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%             Dividir una lista en dos partes.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%------------codigo c#------------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Lista de ejemplo
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };

        int indice = 4; // Índice en el que se quiere dividir la lista

        Console.WriteLine("Lista original:");
        Console.WriteLine($"[{string.Join(", ", lista)}]");

        (List<int> primeraParte, List<int> segundaParte) = DividirLista(lista, indice);

        Console.WriteLine($"Primera parte (hasta el índice {indice - 1}):");
        Console.WriteLine($"[{string.Join(", ", primeraParte)}]");

        Console.WriteLine($"Segunda parte (desde el índice {indice}):");
        Console.WriteLine($"[{string.Join(", ", segundaParte)}]");
    }

    static (List<int>, List<int>) DividirLista(List<int> lista, int indice)
    {
        // Asegurarse de que el índice esté dentro de los límites de la lista
        if (indice < 0 || indice > lista.Count)
        {
            throw new ArgumentOutOfRangeException("Índice fuera de los límites de la lista.");
        }

        // Crear las dos partes de la lista
        List<int> primeraParte = lista.GetRange(0, indice);
        List<int> segundaParte = lista.GetRange(indice, lista.Count - indice);

        return (primeraParte, segundaParte);
    }
}


%-------------------codigo en prolog----------------------------
% Predicado principal para dividir la lista
dividir_lista(Lista, Indice, Parte1, Parte2) :-
    Indice >= 0,                          % Asegurarse de que el índice no sea negativo
    dividir_aux(Lista, Indice, Parte1, Parte2).

% Caso base: si el índice es 0, la primera parte es vacía
dividir_aux(Lista, 0, [], Lista) :- !.
dividir_aux([], _, [], []) :- !.        % Si la lista original está vacía, ambas partes son vacías

dividir_aux([H|T], Indice, [H|Parte1], Parte2) :-
    Indice > 0,                           % Solo agregar a la primera parte si el índice es mayor que 0
    N is Indice - 1,                      % Decrementar el índice
    dividir_aux(T, N, Parte1, Parte2).    % Llamada recursiva con la cola de la lista

dividir_aux(Lista, 0, [], Lista) :- !.   % Caso base para cuando se ha llegado al índice de división

% Ejemplo de uso
ejemplo :-
    Lista = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    Indice = 4,
    write('Lista original: '), write(Lista), nl,
    dividir_lista(Lista, Indice, Parte1, Parte2),
    write('Primera parte: '), write(Parte1), nl,
    write('Segunda parte: '), write(Parte2), nl.
