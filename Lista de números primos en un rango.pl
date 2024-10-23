% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determine 
%           Lista de números primos en un rango.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%------------Codigo c#----------------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        Console.Write("Ingrese el límite inferior del rango: ");
        int limiteInferior = int.Parse(Console.ReadLine());

        Console.Write("Ingrese el límite superior del rango: ");
        int limiteSuperior = int.Parse(Console.ReadLine());

        List<int> primos = ObtenerPrimosEnRango(limiteInferior, limiteSuperior);
        
        Console.WriteLine($"Los números primos en el rango de {limiteInferior} a {limiteSuperior} son: {string.Join(", ", primos)}");
    }

    static List<int> ObtenerPrimosEnRango(int limiteInferior, int limiteSuperior)
    {
        List<int> primos = new List<int>();

        for (int num = limiteInferior; num <= limiteSuperior; num++)
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

%--------------------Codigo en prolog---------------------
% Verifica si un número es primo
es_primo(2).  % 2 es primo
es_primo(N) :-
    N > 2,
    \+ tiene_divisor(N, 2).  % N no debe tener divisores desde 2 hasta N-1

% Verifica si un número tiene un divisor
tiene_divisor(N, D) :-
    D * D =< N,        % Solo comprobar hasta la raíz cuadrada de N
    ( N mod D =:= 0 -> true ; D1 is D + 1, tiene_divisor(N, D1) ).

% Genera la lista de números primos en un rango
primos_en_rango(LimiteInferior, LimiteSuperior, Primos) :-
    findall(N, (between(LimiteInferior, LimiteSuperior, N), es_primo(N)), Primos).

% Ejemplo de uso
:- initialization(main).
main :-
    write('Ingrese el límite inferior del rango: '),
    read(LimiteInferior),
    write('Ingrese el límite superior del rango: '),
    read(LimiteSuperior),
    primos_en_rango(LimiteInferior, LimiteSuperior, Primos),
    write('Los números primos en el rango de '), write(LimiteInferior), write(' a '), write(LimiteSuperior), write(' son: '),
    write(Primos), nl.
