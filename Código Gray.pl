
% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Código Gray.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%-----------Codigo en C#-----------------------------
using System;

class Program
{
    static void Main()
    {
        Console.Write("Introduce un número decimal: ");
        int decimalNumber = int.Parse(Console.ReadLine());
        int grayCode = ConvertToGray(decimalNumber);
        
        Console.WriteLine($"El código Gray de {decimalNumber} es: {grayCode}");
    }

    static int ConvertToGray(int num)
    {
        return num ^ (num >> 1);
    }
}

%------------Codigo en prolog------------------
% Conversión de decimal a binario
decimal_a_binario(0, [0]).
decimal_a_binario(N, Binario) :-
    N > 0,
    Restante is N // 2,
    Resto is N mod 2,
    decimal_a_binario(Restante, BinarioRestante),
    append(BinarioRestante, [Resto], Binario).

% Conversión de binario a código Gray
binario_a_gray([], []).
binario_a_gray([X], [X]).
binario_a_gray([X1, X2 | RestoBinario], [X1 | RestoGray]) :-
    (X1 = 1, X2 = 1 -> G1 = 0 ; X1 = 0, X2 = 1 -> G1 = 1 ; X1 = 1, X2 = 0 -> G1 = 1 ; G1 = 0),
    append([G1], RestoGrayRestante, RestoGray),
    binario_a_gray([X2 | RestoBinario], RestoGrayRestante).

% Conversión de decimal a Gray
decimal_a_gray(Decimal, Gray) :-
    decimal_a_binario(Decimal, Binario),
    binario_a_gray(Binario, Gray).

% Predicado para mostrar el resultado
mostrar_codigo_gray(Decimal) :-
    decimal_a_gray(Decimal, Gray),
    format('El código Gray de ~d es: ~w~n', [Decimal, Gray]).

% Ejemplo de uso 
Para ejecutar este código en un intérprete Prolog, simplemente llama al predicado mostrar_codigo_gray/1 con un número decimal, por ejemplo:
?- mostrar_codigo_gray(5).

La salida será algo como
El código Gray de 5 es: [1,1,1].
