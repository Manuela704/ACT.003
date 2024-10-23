% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Determinar si un número entero es primo.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%------------Codigo en c#----------------------
using System;

class Program
{
    static void Main()
    {
        Console.Write("Ingrese un número entero: ");
        int numero = int.Parse(Console.ReadLine());

        if (EsPrimo(numero))
        {
            Console.WriteLine($"{numero} es un número primo.");
        }
        else
        {
            Console.WriteLine($"{numero} no es un número primo.");
        }
    }

    static bool EsPrimo(int numero)
    {
        // Los números menores o iguales a 1 no son primos
        if (numero <= 1) return false;

        // Solo necesitamos comprobar hasta la raíz cuadrada del número
        int limite = (int)Math.Sqrt(numero);
        
        for (int i = 2; i <= limite; i++)
        {
            if (numero % i == 0) // Si es divisible, no es primo
            {
                return false;
            }
        }
        return true; // No se encontró ningún divisor, es primo
    }
}

%-----------------Codigo Prolog-------------------
% es_primo(N) verifica si N es un número primo
es_primo(N) :-
    N > 1,                            % Un número primo debe ser mayor que 1
    \+ tiene_divisor(N, 2).           % No debe tener divisores desde 2 hasta la raíz cuadrada de N

% tiene_divisor(N, D) verifica si N tiene un divisor D
tiene_divisor(N, D) :-
    D * D =< N,                        % Solo verificar hasta la raíz cuadrada de N
    N mod D =:= 0.                    % Si N es divisible por D, entonces no es primo
tiene_divisor(N, D) :-
    D * D =< N,                        % Solo verificar hasta la raíz cuadrada de N
    D1 is D + 1,                       % Incrementar D
    tiene_divisor(N, D1).              % Recursión

% ejemplo de uso
:- initialization(main).
main :-
    write('Ingrese un número entero: '),
    read(N),
    ( es_primo(N) ->
        write(N), write(' es un número primo.'), nl
    ;
        write(N), write(' no es un número primo.'), nl
    ).
