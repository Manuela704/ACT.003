% ===============================================
% Autor: Hernandez Manuela
% Fecha: 21 de octubre de 2024
% Descripción:  Programa en Prolog que determina 
%              el penultimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.

%-------Codigo en C#-------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Definir una lista de ejemplo
        List<int> lista = new List<int> { 1, 2, 3, 4, 5 };

        // Comprobar si la lista tiene al menos dos elementos
        if (lista.Count >= 2)
        {
            // Obtener el penúltimo elemento
            int penultimo = lista[lista.Count - 2];
            Console.WriteLine("El penúltimo elemento es: " + penultimo);
        }
        else
        {
            Console.WriteLine("La lista no tiene suficientes elementos.");
        }
    }
}

        
% ===============================================
% -----------Codigo en C# (Comentado)-----------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Definir una lista de ejemplo
        List<int> lista = new List<int> { 1, 2, 3, 4, 5 };

        // Comprobar si la lista tiene al menos dos elementos
        if (lista.Count >= 2)
        {
            // Obtener el penúltimo elemento
            int penultimo = lista[lista.Count - 2];
            Console.WriteLine("El penúltimo elemento es: " + penultimo);
        }
        else
        {
            Console.WriteLine("La lista no tiene suficientes elementos.");
        }
    }
}
-------------------------------------------------------------------------
---------------Codigo de Prolog ------------------------------------

% Definición del predicado penultimo/2 que encuentra el penúltimo elemento de una lista

% Caso base: cuando la lista tiene dos elementos, el primero es el penúltimo
penultimo([X,_], X).

% Caso recursivo: ignora el primer elemento y sigue con la cola de la lista
penultimo([_|T], X) :-
    penultimo(T, X).



