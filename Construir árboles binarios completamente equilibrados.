% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
% Construir árboles binarios completamente equilibrados.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%--------------codigo c#----------------------
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

        // Método para construir el árbol a partir de un arreglo
        public void ConstruirArbol(int[] arreglo)
        {
            Raiz = ConstruirArbolRecursivo(arreglo, 0, arreglo.Length - 1);
        }

        // Método recursivo para construir el árbol
        private Nodo ConstruirArbolRecursivo(int[] arreglo, int inicio, int fin)
        {
            if (inicio > fin)
                return null;

            int medio = (inicio + fin) / 2;
            Nodo nodo = new Nodo(arreglo[medio]);

            nodo.Izquierdo = ConstruirArbolRecursivo(arreglo, inicio, medio - 1);
            nodo.Derecho = ConstruirArbolRecursivo(arreglo, medio + 1, fin);

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
        int[] arreglo = { 1, 2, 3, 4, 5, 6, 7 }; // Ejemplo de arreglo
        ArbolBinario arbol = new ArbolBinario();
        arbol.ConstruirArbol(arreglo);

        Console.WriteLine("Recorrido in-order del árbol binario equilibrado:");
        arbol.MostrarArbol(arbol.Raiz);
    }
}


%----------------------codigo prolog--------------------
% Definición de un nodo del árbol
:- dynamic nodo/3. % nodo(Valor, Izquierdo, Derecho).

% Constructor del árbol binario equilibrado
construir_arbol([], nil). % Caso base: lista vacía
construir_arbol(Lista, Nodo) :-
    length(Lista, Length),
    MidIndex is Length // 2, % Índice del medio
    nth0(MidIndex, Lista, Raiz), % Obtener el elemento del medio
    eliminar_elemento(MidIndex, Lista, Resto), % Eliminar el elemento del medio
    construir_arbol(Resto, Izquierdo, Derecho), % Construir las sublistas
    Nodo = nodo(Raiz, Izquierdo, Derecho).

% Eliminar el elemento en el índice dado de la lista
eliminar_elemento(Index, Lista, Resto) :-
    length(Prefix, Index), % Crear un prefijo de longitud Index
    append(Prefix, [_|Suffix], Lista), % Dividir la lista en Prefijo y Sufijo
    append(Prefix, Suffix, Resto). % Combinar el prefijo y el sufijo

% Mostrar el árbol en orden
mostrar_arbol(nil).
mostrar_arbol(nodo(Valor, Izquierdo, Derecho)) :-
    mostrar_arbol(Izquierdo),
    write(Valor), nl,
    mostrar_arbol(Derecho).

% Ejemplo de uso
ejemplo :-
    Lista = [1, 2, 3, 4, 5, 6, 7], % Lista de enteros
    construir_arbol(Lista, Arbol),
    write('Árbol binario equilibrado en orden:'), nl,
    mostrar_arbol(Arbol).
