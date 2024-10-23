
% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Árboles binarios simétricos.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%----------Codigo c#---------------------------
using System;

class Program
{
    public class Nodo
    {
        public int Valor;
        public Nodo Izquierdo;
        public Nodo Derecho;

        public Nodo(int valor)
        {
            Valor = valor;
            Izquierdo = null;
            Derecho = null;
        }
    }

    public class ArbolBinario
    {
        public Nodo Raiz;

        // Método para verificar si el árbol es simétrico
        public bool EsSimetrico()
        {
            return EsSimetrico(Raiz, Raiz);
        }

        // Método recursivo para comparar dos subárboles
        private bool EsSimetrico(Nodo nodo1, Nodo nodo2)
        {
            // Ambos nodos son nulos
            if (nodo1 == null && nodo2 == null)
                return true;

            // Solo uno de los nodos es nulo
            if (nodo1 == null || nodo2 == null)
                return false;

            // Compara los valores de los nodos y recorre los hijos
            return (nodo1.Valor == nodo2.Valor) &&
                   EsSimetrico(nodo1.Izquierdo, nodo2.Derecho) &&
                   EsSimetrico(nodo1.Derecho, nodo2.Izquierdo);
        }

        // Método para agregar un nodo al árbol (para pruebas)
        public void Agregar(int valor)
        {
            Raiz = AgregarRecursivo(Raiz, valor);
        }

        private Nodo AgregarRecursivo(Nodo nodo, int valor)
        {
            if (nodo == null)
            {
                return new Nodo(valor);
            }

            if (valor < nodo.Valor)
            {
                nodo.Izquierdo = AgregarRecursivo(nodo.Izquierdo, valor);
            }
            else
            {
                nodo.Derecho = AgregarRecursivo(nodo.Derecho, valor);
            }

            return nodo;
        }

        // Método para mostrar el árbol en orden (in-order)
        public void MostrarArbol(Nodo nodo)
        {
            if (nodo != null)
            {
                MostrarArbol(nodo.Izquierdo);
                Console.Write(nodo.Valor + " ");
                MostrarArbol(nodo.Derecho);
            }
        }
    }

    static void Main()
    {
        ArbolBinario arbol = new ArbolBinario();
        // Construir un árbol simétrico
        arbol.Agregar(4);
        arbol.Agregar(2);
        arbol.Agregar(6);
        arbol.Agregar(1);
        arbol.Agregar(3);
        arbol.Agregar(5);
        arbol.Agregar(7);

        Console.WriteLine("Árbol en orden (in-order):");
        arbol.MostrarArbol(arbol.Raiz);
        Console.WriteLine();

        // Verificar si el árbol es simétrico
        if (arbol.EsSimetrico())
        {
            Console.WriteLine("El árbol es simétrico.");
        }
        else
        {
            Console.WriteLine("El árbol no es simétrico.");
        }

        // Crear un árbol no simétrico para comparar
        ArbolBinario arbolNoSimetrico = new ArbolBinario();
        arbolNoSimetrico.Agregar(4);
        arbolNoSimetrico.Agregar(2);
        arbolNoSimetrico.Agregar(6);
        arbolNoSimetrico.Agregar(1);
        arbolNoSimetrico.Agregar(5);
        arbolNoSimetrico.Agregar(7);
        arbolNoSimetrico.Agregar(8); // Agregar un valor para hacerlo no simétrico

        Console.WriteLine("Árbol no simétrico en orden (in-order):");
        arbolNoSimetrico.MostrarArbol(arbolNoSimetrico.Raiz);
        Console.WriteLine();

        // Verificar si el árbol no es simétrico
        if (arbolNoSimetrico.EsSimetrico())
        {
            Console.WriteLine("El árbol no simétrico es simétrico.");
        }
        else
        {
            Console.WriteLine("El árbol no simétrico no es simétrico.");
        }
    }
}

%-----------Codigo prolog-----------------------------
% Definición de un nodo del árbol
:- dynamic nodo/3. % nodo(Valor, Izquierdo, Derecho).

% Constructor para un árbol vacío
arbol_vacio(nil).

% Constructor para un árbol no vacío
arbol(Valor, Izquierdo, Derecho) :- 
    nodo(Valor, Izquierdo, Derecho).

% Agregar un nodo al árbol (para fines de prueba)
agregar(NuevoValor, nil, nodo(NuevoValor, nil, nil)).
agregar(NuevoValor, nodo(Valor, Izquierdo, Derecho), nodo(Valor, NuevoIzquierdo, Derecho)) :-
    NuevoValor < Valor,
    agregar(NuevoValor, Izquierdo, NuevoIzquierdo).
agregar(NuevoValor, nodo(Valor, Izquierdo, Derecho), nodo(Valor, Izquierdo, NuevoDerecho)) :-
    NuevoValor > Valor,
    agregar(NuevoValor, Derecho, NuevoDerecho).

% Verificar si el árbol es simétrico
es_simetrico(nil).
es_simetrico(nodo(_, Izquierdo, Derecho)) :-
    es_simetrico_ayuda(Izquierdo, Derecho).

% Compara dos subárboles para simetría
es_simetrico_ayuda(nil, nil).
es_simetrico_ayuda(nodo(_, IzqIzquierda, IzqDerecha), nodo(_, DerIzquierda, DerDerecha)) :-
    es_simetrico_ayuda(IqDerecha, DerIzquierda), % El hijo derecho del subárbol izquierdo con el hijo izquierdo del subárbol derecho
    es_simetrico_ayuda(IzqIzquierda, DerDerecha). % El hijo izquierdo del subárbol izquierdo con el hijo derecho del subárbol derecho

% Mostrar el árbol en orden (in-order)
mostrar_arbol(nil).
mostrar_arbol(nodo(Valor, Izquierdo, Derecho)) :-
    mostrar_arbol(Izquierdo),
    write(Valor), nl,
    mostrar_arbol(Derecho).

% Ejemplo de uso
ejemplo :-
    % Crear un árbol simétrico
    agregar(4, nil, Arbol1),
    agregar(2, Arbol1, Arbol2),
    agregar(6, Arbol2, Arbol3),
    agregar(1, Arbol3, Arbol4),
    agregar(3, Arbol4, Arbol5),
    agregar(5, Arbol5, Arbol6),
    agregar(7, Arbol6, ArbolSimetrico),

    write('Árbol simétrico en orden:'), nl,
    mostrar_arbol(ArbolSimetrico),

    (es_simetrico(ArbolSimetrico) ->
        write('El árbol es simétrico.');
        write('El árbol no es simétrico.')
    ),
    nl,

    % Crear un árbol no simétrico
    agregar(8, ArbolSimetrico, ArbolNoSimetrico),
    
    write('Árbol no simétrico en orden:'), nl,
    mostrar_arbol(ArbolNoSimetrico),

    (es_simetrico(ArbolNoSimetrico) ->
        write('El árbol no simétrico es simétrico.');
        write('El árbol no simétrico no es simétrico.')
    ),
    nl.
