% ===============================================
% Autor: Hernandez Manuela
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que invierta una lista           
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> numeros = new List<int> { 1, 2, 3, 4, 5 };
        List<int> listaInvertida = InvertirLista(numeros);

        Console.WriteLine("Lista invertida:");
        foreach (int numero in listaInvertida)
        {
            Console.Write(numero + " ");
        }
    }

    static List<int> InvertirLista(List<int> lista)
    {
        List<int> invertida = new List<int>();
        for (int i = lista.Count - 1; i >= 0; i--)
        {
            invertida.Add(lista[i]);
        }
        return invertida;
    }
}


-----------Codigo en prolog --------------
% Caso base: la lista vacía se invierte en la lista vacía.
invertir([], []).

% Regla recursiva: invierte la cola de la lista y añade la cabeza al final.
invertir([H|T], ListaInvertida) :-
    invertir(T, TInvertida),
    append(TInvertida, [H], ListaInvertida).
