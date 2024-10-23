% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%      Tabla de verdad para expresiones lógicas.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%-----------Codigo en c#---------------------------
using System;

class Program
{
    static void Main()
    {
        // Definir las variables
        bool[] valores = { false, true };
        Console.WriteLine("A\tB\tA AND B\tA OR B\tNOT A");

        // Generar la tabla de verdad
        foreach (bool A in valores)
        {
            foreach (bool B in valores)
            {
                bool andResult = A && B;
                bool orResult = A || B;
                bool notA = !A;

                // Mostrar los resultados
                Console.WriteLine($"{A}\t{B}\t{andResult}\t{orResult}\t{notA}");
            }
        }
    }
}
La salida del programa será algo como:

mathematica
Copiar código
A       B       A AND B  A OR B   NOT A
False   False   False    False    True
False   True    False    True     True
True    False   False    True     False
True    True    True     True     False
Esta tabla muestra los resultados de las operaciones lógicas para todas las combinaciones de 
𝐴 A y B

%-----------------Codigo Prolog-----------------------------
% Define las operaciones lógicas
and(true, true, true).
and(true, false, false).
and(false, true, false).
and(false, false, false).

or(true, true, true).
or(true, false, true).
or(false, true, true).
or(false, false, false).

not(true, false).
not(false, true).

% Genera la tabla de verdad
tabla_verdad :-
    write('A\tB\tA AND B\tA OR B\tNOT A\n'),
    generar_tabla.

% Genera todas las combinaciones posibles de A y B
generar_tabla :-
    valores(A),
    valores(B),
    and(A, B, AndResult),
    or(A, B, OrResult),
    not(A, NotA),
    format('~w\t~w\t~w\t~w\t~w\n', [A, B, AndResult, OrResult, NotA]),
    fail.  % Forzar la retrocesión para seguir generando más combinaciones
generar_tabla.  % Termina el predicado

% Define los valores posibles para A y B
valores(true).
valores(false).

% Ejemplo de uso
:- initialization(main).
main :-
    tabla_verdad.
