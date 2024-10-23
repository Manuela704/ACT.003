% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
% los factores primos de un número entero positivo.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%----------------Codigo c#-----------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        Console.Write("Ingrese un número entero positivo: ");
        int numero = int.Parse(Console.ReadLine());

        List<int> factoresPrimos = ObtenerFactoresPrimos(numero);
        
        Console.WriteLine($"Los factores primos de {numero} son: {string.Join(", ", factoresPrimos)}");
    }

    static List<int> ObtenerFactoresPrimos(int numero)
    {
        List<int> factores = new List<int>();
        
        // Comienza con el primer número primo
        for (int i = 2; i <= numero; i++)
        {
            while (numero % i == 0) // Mientras i sea un factor
            {
                factores.Add(i); // Agregar el factor primo
                numero /= i; // Dividir el número por i
            }
        }

        return factores; // Retorna la lista de factores primos
    }
}

%--------------Codigo Prolog---------------------------
% factor_primo(N, F) se cumple si F es un factor primo de N
factor_primo(N, F) :-
    F > 1,
    F =< N,
    N mod F =:= 0.  % F es un factor de N

% factorizar(N, Factores) encuentra todos los factores primos de N
factorizar(1, []).  % Caso base: la factorización de 1 es la lista vacía
factorizar(N, [F|Factores]) :-
    factor_primo(N, F),  % Encuentra un factor primo F
    N1 is N // F,        % Dividir N por F
    factorizar(N1, Factores).  % Continuar la factorización con N1

% Ejemplo de uso
:- initialization(main).
main :-
    write('Ingrese un número entero positivo: '),
    read(N),
    ( N > 0 ->
        factorizar(N, Factores),
        write('Los factores primos de '), write(N), write(' son: '),
        write(Factores), nl
    ;
        write('Por favor, ingrese un número entero positivo.'), nl
    ).
