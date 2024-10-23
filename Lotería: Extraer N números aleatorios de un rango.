% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que Lotería: Extraer
%               N números aleatorios de un rango.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%-----------Codigo en c#-----------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        int rangoInferior = 1; // Límite inferior del rango
        int rangoSuperior = 49; // Límite superior del rango
        int cantidadNumeros = 6; // Número de números a extraer

        List<int> numerosAleatorios = ExtraerNumerosAleatorios(rangoInferior, rangoSuperior, cantidadNumeros);

        Console.WriteLine("Números aleatorios extraídos: " + string.Join(", ", numerosAleatorios));
    }

    static List<int> ExtraerNumerosAleatorios(int rangoInferior, int rangoSuperior, int cantidad)
    {
        Random random = new Random();
        HashSet<int> numeros = new HashSet<int>();

        while (numeros.Count < cantidad)
        {
            // Generar un número aleatorio en el rango especificado
            int numero = random.Next(rangoInferior, rangoSuperior + 1);
            numeros.Add(numero); // Añadir el número al conjunto (solo únicos)
        }

        return new List<int>(numeros); // Convertir el HashSet a una lista y devolver
    }
}


%------------------Codigo en Prolog------------------------
:- use_module(library(random)).
:- use_module(library(lists)).

% extraer_numeros_aleatorios(RangoInferior, RangoSuperior, Cantidad, Numeros)
extraer_numeros_aleatorios(RangoInferior, RangoSuperior, Cantidad, Numeros) :-
    findall(X, (between(RangoInferior, RangoSuperior, X), random(X)), ListaNumeros),
    random_permutation(ListaNumeros, ListaAleatoria), % Mezcla los números
    length(Numeros, Cantidad), % Crea una lista de longitud Cantidad
    append(Numeros, _, ListaAleatoria). % Toma los primeros N números

% Ejemplo de uso
:- initialization(main).
main :-
    RangoInferior = 1,
    RangoSuperior = 49,
    Cantidad = 6,
    extraer_numeros_aleatorios(RangoInferior, RangoSuperior, Cantidad, Numeros),
    write('Números aleatorios extraídos: '), write(Numeros), nl.
