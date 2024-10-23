% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%          si dos números positivos son coprimos.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================


%--------------------Codigo en c#----------------
using System;

class Program
{
    static void Main()
    {
        Console.Write("Ingrese el primer número positivo: ");
        int num1 = int.Parse(Console.ReadLine());

        Console.Write("Ingrese el segundo número positivo: ");
        int num2 = int.Parse(Console.ReadLine());

        if (SonCoprimos(num1, num2))
        {
            Console.WriteLine($"{num1} y {num2} son coprimos.");
        }
        else
        {
            Console.WriteLine($"{num1} y {num2} no son coprimos.");
        }
    }

    static bool SonCoprimos(int a, int b)
    {
        return ObtenerMCD(a, b) == 1;
    }

    static int ObtenerMCD(int a, int b)
    {
        while (b != 0)
        {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a; // El MCD es el último valor de a
    }
}


%-------------------Codigo en Prolog----------------------
% mcd(A, B, MCD) calcula el máximo común divisor de A y B
mcd(A, 0, A) :- A > 0.  % Caso base: si B es 0, el MCD es A
mcd(A, B, MCD) :- B > 0,  % Si B es positivo, calcular el MCD
    Resto is A mod B,
    mcd(B, Resto, MCD).

% son_coprimos(A, B) verifica si A y B son coprimos
son_coprimos(A, B) :-
    A > 0,
    B > 0,
    mcd(A, B, MCD),
    MCD =:= 1.  % Si el MCD es 1, son coprimos

% Ejemplo de uso
:- initialization(main).
main :-
    write('Ingrese el primer número positivo: '),
    read(A),
    write('Ingrese el segundo número positivo: '),
    read(B),
    ( son_coprimos(A, B) ->
        write(A), write(' y '), write(B), write(' son coprimos.'), nl
    ;
        write(A), write(' y '), write(B), write(' no son coprimos.'), nl
    ).
