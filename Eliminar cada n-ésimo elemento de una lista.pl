% ===============================================
% Autor: Juan Pérez
% Fecha: 13 de octubre de 2024
% Descripción: Programa en Prolog que determine
%              eliminar cada n-esimo de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%-------------Codigo C#---------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Lista de ejemplo
        var list = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
        int n = 3; // Especificar el n-ésimo elemento a eliminar

        // Eliminar cada n-ésimo elemento
        var modifiedList = RemoveNthElement(list, n);

        // Mostrar la lista resultante
        Console.WriteLine(string.Join(", ", modifiedList));
    }

    // Método para eliminar cada n-ésimo elemento de la lista
    static List<T> RemoveNthElement<T>(List<T> list, int n)
    {
        var result = new List<T>();

        for (int i = 0; i < list.Count; i++)
        {
            // Solo añadir el elemento si no es un n-ésimo
            if ((i + 1) % n != 0) // +1 para convertir a índice 1
            {
                result.Add(list[i]);
            }
        }

        return result;
    }
}


%-----------Codigo en Prolog----------------------------
% Caso base: Si la lista está vacía, la lista resultante también está vacía.
eliminar_n_esimo([], _, []).

% Caso recursivo: Eliminar el n-ésimo elemento.
eliminar_n_esimo(Lista, N, Resultado) :-
    eliminar_n_esimo(Lista, N, 1, Resultado).  % Llamar a la función auxiliar con el contador inicial.

% Función auxiliar que lleva un contador.
eliminar_n_esimo([], _, _, []).  % Caso base: Lista vacía.

eliminar_n_esimo([Cabeza|Cola], N, Contador, Resultado) :-
    (   Contador mod N =:= 0  % Verifica si es el n-ésimo elemento.
    ->  Resultado = ColaResultado,  % No se incluye en el resultado.
        NuevaContador is Contador + 1,
        eliminar_n_esimo(Cola, N, NuevaContador, ColaResultado)
    ;   Resultado = [Cabeza|ColaResultado],  % Se incluye en el resultado.
        NuevaContador is Contador + 1,
        eliminar_n_esimo(Cola, N, NuevaContador, ColaResultado)
    ).


% Ejemplo de uso 
?- eliminar_n_esimo([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3, Resultado).
Resultado = [1, 2, 4, 5, 7, 8, 10].









