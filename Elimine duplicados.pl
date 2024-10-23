% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que Elimine 
%   duplicados consecutivos de los elementos 
%    de una lista.
%    Se incluye una versión comentada
%     en C# para referencia.
% ===============================================

%------------Codigo C#--------------------------
using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main()
    {
        // Lista de ejemplo con duplicados consecutivos
        var list = new List<int> { 1, 1, 2, 2, 3, 1, 1, 4, 4, 5, 5, 5, 6 };

        // Eliminar duplicados consecutivos
        var result = RemoveConsecutiveDuplicates(list);

        // Mostrar la lista resultante
        Console.WriteLine(string.Join(", ", result));
    }

    // Método para eliminar duplicados consecutivos
    static List<T> RemoveConsecutiveDuplicates<T>(List<T> list)
    {
        if (list == null || list.Count == 0)
            return new List<T>();

        var result = new List<T> { list[0] };  // Agregar el primer elemento

        for (int i = 1; i < list.Count; i++)
        {
            if (!list[i].Equals(list[i - 1]))   // Comparar con el anterior
            {
                result.Add(list[i]);
            }
        }

        return result;
    }
}
% Ejemplo 
Si usas la lista de ejemplo { 1, 1, 2, 2, 3, 1, 1, 4, 4, 5, 5, 5, 6 }, la salida será:
1, 2, 3, 1, 4, 5, 6



%----------Codigo en Prolog ---------------------------------
% Caso base: Una lista vacía resulta en una lista vacía.
eliminar_duplicados([], []).

% Caso recursivo: Si la cabeza es igual a la cabeza de la lista resultante, lo omitimos.
eliminar_duplicados([Cabeza, Cabeza|Cola], Resultado) :-
    eliminar_duplicados([Cabeza|Cola], Resultado).

% Caso recursivo: Si la cabeza es diferente, la añadimos a la lista resultante.
eliminar_duplicados([Cabeza|Cola], [Cabeza|Resultado]) :-
    Cola \= [],  % Aseguramos que la cola no esté vacía
    Cola = [Siguiente|_],  % Capturamos el siguiente elemento
    Cabeza \= Siguiente,  % Comprobamos que es diferente
    eliminar_duplicados(Cola, Resultado).

%Ejemplo de uso 
?- eliminar_duplicados([1, 1, 2, 2, 3, 1, 1, 4, 4, 5, 5, 5, 6], Resultado).
Resultado = [1, 2, 3, 1, 4, 5, 6].
