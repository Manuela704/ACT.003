% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Conjetura de Goldbach.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%--------------Codigo c#---------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        Console.Write("Ingrese un número par mayor que 2: ");
        int numero = int.Parse(Console.ReadLine());

        if (numero <= 2 || numero % 2 != 0)
        {
            Console.WriteLine("Por favor, ingrese un número par mayor que 2.");
            return;
        }

        if (VerificarConjeturaGoldbach(numero))
        {
            Console.WriteLine($"La conjetura de Goldbach se cumple para {numero}.");
        }
        else
        {
            Console.WriteLine($"La conjetura de Goldbach no se cumple para {numero}.");
        }
    }

    static bool VerificarConjeturaGoldbach(int numero)
    {
        List<int> primos = ObtenerPrimosHasta(numero);

        for (int i = 0; i < primos.Count; i++)
        {
            for (int j = i; j < primos.Count; j++)
            {
                if (primos[i] + primos[j] == numero)
                {
                    Console.WriteLine($"Encontrado: {primos[i]} + {primos[j]} = {numero}");
                    return true;
                }
            }
        }

        return false; // No se encontró ninguna pareja de primos que sume el número
    }

    static List<int> ObtenerPrimosHasta(int limite)
    {
        List<int> primos = new List<int>();

        for (int num = 2; num <= limite; num++)
        {
            if (EsPrimo(num))
            {
                primos.Add(num);
            }
        }

        return primos;
    }

    static bool EsPrimo(int numero)
    {
        if (numero <= 1) return false; // 0 y 1 no son primos
        if (numero == 2) return true;  // 2 es primo
        if (numero % 2 == 0) return false; // Números pares mayores que 2 no son primos

        for (int i = 3; i * i <= numero; i += 2)
        {
            if (numero % i == 0)
                return false; // Si divisible por i, no es primo
        }

        return true; // Si no se encontró divisor, es primo
    }
}

%------------------Codigo prolog------------------------------
% Verifica si un número es primo
es_primo(2).  % 2 es primo
es_primo(N) :- 
    N > 2,
    \+ tiene_divisor(N, 2).  % N no debe tener divisores

% Verifica si un número tiene un divisor
tiene_divisor(N, D) :- 
    D * D =< N, 
    ( N mod D =:= 0 -> true ; D1 is D + 1, tiene_divisor(N, D1) ).

% Verifica la conjetura de Goldbach
conjetura_goldbach(N) :- 
    N > 2, 
    N mod 2 =:= 0,  % Debe ser un número par
    encontrar_primos(N, P1, P2),
    format('Encontrado: ~w + ~w = ~w~n', [P1, P2, N]).

% Encuentra dos números primos que suman N
encontrar_primos(N, P1, P2) :- 
    es_primo(P1),
    P1 =< N,
    P2 is N - P1,
    es_primo(P2),
    P1 =< P2.  % Para evitar duplicados como (3, 5) y (5, 3)

% Ejemplo de uso
:- initialization(main).
main :- 
    write('Ingrese un número par mayor que 2: '),
    read(N),
    ( N > 2, N mod 2 =:= 0 ->
        conjetura_goldbach(N)
    ;
        write('Por favor, ingrese un número par mayor que 2.'), nl
    ).










