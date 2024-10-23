% ===============================================
% Autor: Hernandez Manuela
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que aplane una 
%              estructura de una lista animada.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================



%------------Codigo c#-----------------------------
using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main()
    {
        // Lista de listas anidadas
        var nestedList = new List<object>
        {
            1,
            new List<object> { 2, 3 },
            new List<object> { 4, new List<object> { 5, 6 } },
            7
        };

        // Aplanar la lista
        var flatList = Flatten(nestedList);

        // Mostrar la lista aplanada
        Console.WriteLine(string.Join(", ", flatList));
    }

    // Método recursivo para aplanar la lista
    static List<object> Flatten(List<object> nestedList)
    {
        var result = new List<object>();

        foreach (var item in nestedList)
        {
            if (item is List<object> sublist)
            {
                result.AddRange(Flatten(sublist));
            }
            else
            {
                result.Add(item);
            }
        }

        return result;
    }
}



%--------------Codigo en prolog-----------
% Caso base: Si la lista está vacía, la lista aplanada también está vacía.
aplanar([], []).

% Caso recursivo: Si el primer elemento es una lista, aplanamos esa lista y el resto.
aplanar([Cabeza|Cola], Resultado) :-
    aplanar(Cabeza, CabezaAplanada),  % Aplana la cabeza si es una lista
    aplanar(Cola, ColaAplanada),      % Aplana la cola
    append(CabezaAplanada, ColaAplanada, Resultado).

% Si la cabeza no es una lista, simplemente la colocamos en la lista de resultado.
aplanar(Cabeza, [Cabeza]) :-
    Cabeza \= [_|_].  % Verifica que la cabeza no es una lista.

%Ejemplo de uso 
?- aplanar([1, [2, 3], [4, [5, 6]], 7], Resultado).
Resultado = [1, 2, 3, 4, 5, 6, 7].
