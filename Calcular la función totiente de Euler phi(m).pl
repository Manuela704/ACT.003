% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que Calcule
%            la función totiente de Euler phi(m).
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%--------------Codigo en c#-----------------
using System;

class Program
{
    static void Main()
    {
        Console.Write("Ingrese un número entero positivo m: ");
        int m = int.Parse(Console.ReadLine());

        int phi = CalcularTotienteEuler(m);
        Console.WriteLine($"La función totiente de Euler φ({m}) es: {phi}");
    }

    static int CalcularTotienteEuler(int m)
    {
        int resultado = m; // Inicializamos el resultado con el valor de m
        for (int i = 2; i * i <= m; i++)
        {
            // Si i es un divisor de m, entonces es un factor primo
            if (m % i == 0)
            {
                // Restamos la parte correspondiente a este factor primo
                while (m % i == 0)
                {
                    m /= i; // Eliminamos todos los factores de i
                }
                resultado -= resultado / i; // Aplicamos la fórmula
            }
        }

        // Si m es un número primo mayor que 1
        if (m > 1)
        {
            resultado -= resultado / m; // Aplicamos la fórmula para el último factor primo
        }

        return resultado;
    }
}

%----------------codigo en prolog----------------------------
% Calcula el MCD (máximo común divisor) de dos números
mcd(A, 0, A) :- A > 0.  % Caso base: si B es 0, el MCD es A
mcd(A, B, MCD) :- B > 0,  % Si B es positivo, calcular el MCD
    Resto is A mod B,
    mcd(B, Resto, MCD).

% Verifica si A y B son coprimos
son_coprimos(A, B) :-
    mcd(A, B, MCD),
    MCD =:= 1.  % Son coprimos si su MCD es 1

% Calcula la función totiente de Euler φ(m)
phi(1, 1).  % Caso base: φ(1) es 1
phi(M, Phi) :-
    M > 1,
    findall(N, (between(1, M-1, N), son_coprimos(N, M)), Coprimos),  % Encuentra todos los números coprimos con M
    length(Coprimos, Phi).  % La longitud de la lista de coprimos es φ(M)

% Ejemplo de uso
:- initialization(main).
main :-
    write('Ingrese un número entero positivo m: '),
    read(M),
    phi(M, Phi),
    write('La función totiente de Euler φ('), write(M), write(') es: '), write(Phi), nl.
