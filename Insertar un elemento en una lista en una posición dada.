% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que Insertar un
%       elemento en una lista en una posición dada.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%-------------Codigo en c# -------------------
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Crear una lista de enteros
        List<int> numeros = new List<int> { 1, 2, 3, 4, 5 };

        // Mostrar la lista original
        Console.WriteLine("Lista original: " + string.Join(", ", numeros));

        // Posición donde se quiere insertar el nuevo elemento
        int posicion = 2; // Por ejemplo, queremos insertar en la posición 2
        int nuevoElemento = 99; // Nuevo elemento a insertar

        // Insertar el elemento en la lista
        numeros.Insert(posicion, nuevoElemento);

        // Mostrar la lista después de la inserción
        Console.WriteLine("Lista después de la inserción: " + string.Join(", ", numeros));
    }
}


%--------------------Codigo en prolog---------------------
% insertar_elemento(Elemento, Posicion, ListaOriginal, ListaResultado)
insertar_elemento(Elemento, 0, Lista, [Elemento|Lista]). % Caso base: insertar en la posición 0
insertar_elemento(Elemento, Posicion, [Cabeza|Cola], [Cabeza|ListaResultado]) :-
    Posicion > 0,                               % Asegurarse de que la posición es mayor que 0
    NuevaPosicion is Posicion - 1,              % Decrementar la posición
    insertar_elemento(Elemento, NuevaPosicion, Cola, ListaResultado). % Recursión

% Ejemplo de uso
:- initialization(main).
main :-
    ListaOriginal = [1, 2, 3, 4, 5],
    Elemento = 99,
    Posicion = 2,
    insertar_elemento(Elemento, Posicion, ListaOriginal, ListaResultado),
    write('Lista original: '), write(ListaOriginal), nl,
    write('Lista después de la inserción: '), write(ListaResultado), nl.
