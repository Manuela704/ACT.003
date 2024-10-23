% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que duplique 
%              los elementos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%-----------Codigo C #----------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Lista de ejemplo
        var list = new List<int> { 1, 2, 3, 4, 5 };

        // Duplicar los elementos de la lista
        var duplicatedList = DuplicateElements(list);

        // Mostrar la lista duplicada
        Console.WriteLine(string.Join(", ", duplicatedList));
    }

    // Método para duplicar los elementos de la lista
    static List<T> DuplicateElements<T>(List<T> list)
    {
        var duplicatedList = new List<T>();

        foreach (var item in list)
        {
            duplicatedList.Add(item); // Agregar el elemento original
            duplicatedList.Add(item); // Agregar el elemento duplicado
        }

        return duplicatedList;
    }
}

%----------------Codigo en Prolog--------------------------
% Caso base: Una lista vacía resulta en una lista vacía.
duplicar([], []).

% Caso recursivo: Duplicar el primer elemento y continuar con la cola.
duplicar([Cabeza|Cola], [Cabeza, Cabeza|Resultado]) :-
    duplicar(Cola, Resultado).


 %Ejemplo de uso 
?- duplicar([1, 2, 3, 4, 5], Resultado).
Resultado = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5].

