
% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
% Tabla de verdad para expresiones lógicas (operadores).
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%---------------CODIGO C#--------------------------
using System;

class Program
{
    static void Main()
    {
        // Variables de entrada
        bool[] variables = { false, true };
        
        Console.WriteLine("A\tB\tA AND B\tA OR B\tA NOT\tA XOR B");

        // Generar la tabla de verdad
        for (int i = 0; i < 2; i++) // A
        {
            for (int j = 0; j < 2; j++) // B
            {
                bool A = variables[i];
                bool B = variables[j];

                // Calcular valores de la expresión
                bool andResult = A && B;
                bool orResult = A || B;
                bool notResult = !A; // NOT solo se aplica a A
                bool xorResult = A ^ B;

                // Mostrar la fila de la tabla
                Console.WriteLine($"{A}\t{B}\t{andResult}\t{orResult}\t{notResult}\t{xorResult}");
            }
        }
    }
}

%------------------CODIGO PROLOG----------------------
% Definición de operadores lógicos
:- op(200, fx, '\\').   % NOT
:- op(300, xfy, '\\/').  % OR
:- op(400, xfy, '/\\').  % AND
:- op(500, xfy, xor).    % XOR

% Predicado para calcular la tabla de verdad
tabla_verdad :-
    write('A\tB\tA AND B\tA OR B\tA NOT\tA XOR B'), nl,
    % Generar las combinaciones de verdad
    (   valor(A), valor(B),
        % Calcular resultados
        And is A /\ B,
        Or is A \/ B,
        Not is \\ A,
        Xor is A xor B,
        % Mostrar la fila de la tabla
        format('~w\t~w\t~w\t~w\t~w\t~w', [A, B, And, Or, Not, Xor]), nl,
        fail
    ;   true  % Satisfacer el predicado después de todas las combinaciones
    ).

% Definición de los valores de verdad
valor(0).  % Representa false
valor(1).  % Representa true

% Ejemplo de uso
ejemplo :-
    tabla_verdad.

A       B       A AND B       A OR B        A NOT       A XOR B
0       0       0             0             1           0
0       1       0             1             1           1
1       0       0             1             0           1
1       1       1             1             0           0
