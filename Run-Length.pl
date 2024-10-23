% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21de octubre de 2024
% Descripción: Programa en Prolog Codificación
5                Run-Length de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%-------------------Codigo C#------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Lista de ejemplo
        var list = new List<int> { 1, 1, 2, 2, 2, 3, 1, 1, 4, 4, 4, 4, 5 };

        // Realizar la codificación Run-Length
        var encoded = RunLengthEncode(list);

        // Mostrar la lista codificada
        foreach (var pair in encoded)
        {
            Console.WriteLine($"Valor: {pair.Item1}, Conteo: {pair.Item2}");
        }
    }

    // Método para la codificación Run-Length
    static List<Tuple<T, int>> RunLengthEncode<T>(List<T> list)
    {
        var encoded = new List<Tuple<T, int>>();

        if (list == null || list.Count == 0)
            return encoded;

        T currentValue = list[0];
        int count = 1;

        for (int i = 1; i < list.Count; i++)
        {
            if (list[i].Equals(currentValue))
            {
                count++;
            }
            else
            {
                encoded.Add(new Tuple<T, int>(currentValue, count));
                currentValue = list[i];
                count = 1;
            }
        }

        // Añadir el último grupo
        encoded.Add(new Tuple<T, int>(currentValue, count));

        return encoded;
    }
}

%Ejemplo de uso 
Si usas la lista de ejemplo { 1, 1, 2, 2, 2, 3, 1, 1, 4, 4, 4, 4, 5 }, la salida será:
Valor: 1, Conteo: 2
Valor: 2, Conteo: 3
Valor: 3, Conteo: 1
Valor: 1, Conteo: 2
Valor: 4, Conteo: 4
Valor: 5, Conteo: 1


%-----------------Codigo en Prolog-------------------
% Caso base: Una lista vacía resulta en una lista vacía.
run_length_encode([], []).

% Caso recursivo: Contar las ocurrencias de un elemento consecutivo.
run_length_encode([Cabeza|Cola], [Par|Resultado]) :-
    contar(Cabeza, Cola, Count, Resto),  % Contar ocurrencias
    Par = (Cabeza, Count),               % Crear par (Elemento, Conteo)
    run_length_encode(Resto, Resultado).  % Procesar el resto

% Contar ocurrencias de un elemento y devolver el resto de la lista.
contar(Elemento, [Elemento|Cola], Count, Resto) :-
    contar(Elemento, Cola, Count1, Resto), % Contar el siguiente
    Count is Count1 + 1.                   % Incrementar el conteo
contar(Elemento, [Otro|Cola], 1, [Otro|Cola]) :- % Cuando encontramos un elemento diferente
    Elemento \= Otro.                      % Asegurarnos de que no son iguales
contar(Elemento, [], 1, []).              % Caso base: lista vacía, se cuenta 1

%Ejercicio comun 
?- run_length_encode([1, 1, 2, 2, 2, 3, 1, 1, 4, 4, 4, 4, 5], Resultado).
Resultado = [(1, 2), (2, 3), (3, 1), (1, 2), (4, 4), (5, 1)].
