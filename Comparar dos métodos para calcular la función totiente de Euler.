% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
% Comparar dos métodos para calcular la función totiente 
%                de Euler.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%-------------Codigo c#--------------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        int n = 36; // Ejemplo para n

        // Calcular totiente usando el método directo
        int totienteDirecto = CalcularTotienteDirecto(n);
        Console.WriteLine($"Método Directo: φ({n}) = {totienteDirecto}");

        // Calcular totiente usando factorización
        int totienteFactorizacion = CalcularTotienteFactorizacion(n);
        Console.WriteLine($"Método Factorización: φ({n}) = {totienteFactorizacion}");
    }

    // Método directo para calcular φ(n)
    static int CalcularTotienteDirecto(int n)
    {
        int count = 0;
        for (int i = 1; i < n; i++)
        {
            if (GCD(i, n) == 1) // Comprobar si son coprimos
            {
                count++;
            }
        }
        return count;
    }

    // Método de Euclides para calcular el GCD
    static int GCD(int a, int b)
    {
        while (b != 0)
        {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    // Método de factorización para calcular φ(n)
    static int CalcularTotienteFactorizacion(int n)
    {
        int result = n;
        for (int p = 2; p * p <= n; p++)
        {
            // Verifica si p es un factor primo de n
            if (n % p == 0)
            {
                // Si es un factor, calcula φ(n)
                while (n % p == 0)
                {
                    n /= p;
                }
                result -= result / p; // Aplica la fórmula φ(n) = n * (1 - 1/p)
            }
        }
        // Si hay un factor primo mayor que sqrt(n)
        if (n > 1)
        {
            result -= result / n;
        }
        return result;
    }
}

%------------Codigo en prolog-----------------
% Método directo para calcular φ(n)
totiente_directo(N, Totiente) :-
    findall(X, (between(1, N, X), gcd(X, N, 1), X < N), Coprimos),
    length(Coprimos, Totiente).

% Algoritmo de Euclides para calcular el GCD
gcd(A, 0, A) :- !.
gcd(A, B, GCD) :-
    B > 0,
    R is A mod B,
    gcd(B, R, GCD).

% Método de factorización para calcular φ(n)
totiente_factorizacion(N, Totiente) :-
    N > 0,
    factor_primos(N, Primos),
    calcular_totiente(N, Primos, Totiente).

factor_primos(N, Primos) :-
    findall(P, (between(2, N, P), es_primo(P), N mod P =:= 0), PrimosSinDuplicados),
    list_to_set(PrimosSinDuplicados, Primos).

es_primo(P) :-
    P > 1,
    \+ (between(2, P1, P), P1 is P - 1, 0 is P mod P1).

calcular_totiente(N, [], N) :- !. % Si no hay más primos, devuelve N
calcular_totiente(N, [P|Rest], Totiente) :-
    N1 is N * (P - 1) // P,
    calcular_totiente(N1, Rest, Totiente).

% Comparar ambos métodos
comparar_totientes(N) :-
    totiente_directo(N, TotienteDirecto),
    totiente_factorizacion(N, TotienteFactorizacion),
    format('Método Directo: φ(~d) = ~d~n', [N, TotienteDirecto]),
    format('Método Factorización: φ(~d) = ~d~n', [N, TotienteFactorizacion]).

% Ejemplo de usos 
% Para ejecutar el código en un intérprete de Prolog, puedes hacer lo siguiente:
?- comparar_totientes(36).
% La salida mostrará el valor de ϕ(36) utilizando ambos métodos:
Método Directo: φ(36) = 12
Método Factorización: φ(36) = 12

