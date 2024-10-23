
% ===============================================
% Autor: Hernandez Manuela 
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%  Ordenar una lista de listas según la frecuencia 
% de la longitud de las sublistas.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

%--------Codigo c#-----------------------------
using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main()
    {
        // Ejemplo de lista de listas
        List<List<int>> listaDeListas = new List<List<int>>()
        {
            new List<int> { 1, 2 },
            new List<int> { 3, 4, 5 },
            new List<int> { 6 },
            new List<int> { 7, 8, 9, 10 },
            new List<int> { 11, 12 },
            new List<int> { 13, 14, 15 }
        };

        // Ordenar la lista de listas según la frecuencia de la longitud de las sublistas
        var listaOrdenada = OrdenarPorFrecuencia(listaDeListas);

        // Mostrar el resultado
        Console.WriteLine("Lista de listas ordenada:");
        foreach (var sublista in listaOrdenada)
        {
            Console.WriteLine($"[{string.Join(", ", sublista)}]");
        }
    }

    static List<List<int>> OrdenarPorFrecuencia(List<List<int>> listaDeListas)
    {
        // Calcular la frecuencia de la longitud de las sublistas
        var frecuencia = listaDeListas
            .GroupBy(sublista => sublista.Count) // Agrupar por longitud
            .Select(g => new
            {
                Longitud = g.Key,
                Conteo = g.Count()
            })
            .OrderByDescending(g => g.Conteo) // Ordenar por frecuencia
            .ToList();

        // Crear un diccionario para la longitud y sus sublistas
        var diccionarioPorLongitud = new Dictionary<int, List<List<int>>>();
        foreach (var sublista in listaDeListas)
        {
            int longitud = sublista.Count;
            if (!diccionarioPorLongitud.ContainsKey(longitud))
            {
                diccionarioPorLongitud[longitud] = new List<List<int>>();
            }
            diccionarioPorLongitud[longitud].Add(sublista);
        }

        // Ordenar las sublistas según la frecuencia de longitud
        List<List<int>> resultado = new List<List<int>>();
        foreach (var grupo in frecuencia)
        {
            if (diccionarioPorLongitud.ContainsKey(grupo.Longitud))
            {
                resultado.AddRange(diccionarioPorLongitud[grupo.Longitud]);
            }
        }

        return resultado;
    }
}

%----------------Codigo en prolog -----------------------
% Calcula la longitud de cada sublista
longitud_sublistas([], []).
longitud_sublistas([Sublista|Resto], [Longitud|Longitudes]) :-
    length(Sublista, Longitud),
    longitud_sublistas(Resto, Longitudes).

% Cuenta la frecuencia de cada longitud
contar_frecuencia([], []).
contar_frecuencia(Longitudes, Frecuencias) :-
    sort(Longitudes, LongitudesUnicas), % Obtener longitudes únicas
    contar_frecuencia(Longitudes, LongitudesUnicas, Frecuencias).

contar_frecuencia(_, [], []).
contar_frecuencia(Longitudes, [Longitud|Resto], [Longitud-Count|Frecuencias]) :-
    include(=(Longitud), Longitudes, ListConLongitud),
    length(ListConLongitud, Count), % Contar cuántas veces aparece
    contar_frecuencia(Longitudes, Resto, Frecuencias).

% Ordena la lista de listas por la frecuencia de las longitudes
ordenar_por_frecuencia(Listas, Resultado) :-
    longitud_sublistas(Listas, Longitudes),
    contar_frecuencia(Longitudes, Frecuencias),
    predicado_ordenar(Frecuencias, Listas, Resultado).

% Predicado auxiliar para ordenar
predicado_ordenar(Frecuencias, Listas, Resultado) :-
    % Clasificamos las frecuencias en orden descendente
    keysort(Frecuencias, Ordenado),
    reverse(Ordenado, OrdenadoDesc),
    obtener_listas(OrdenadoDesc, Listas, Resultado).

% Obtener las listas en el orden de frecuencias
obtener_listas([], _, []).
obtener_listas([Longitud-_|Resto], Listas, Resultado) :-
    include(longitud_igual(Longitud), Listas, ListasConLongitud),
    append(ListasConLongitud, ListasSinLongitud, Listas),
    obtener_listas(Resto, ListasSinLongitud, RestoResultado),
    append(ListasConLongitud, RestoResultado, Resultado).

% Predicado que verifica la longitud
longitud_igual(Longitud, Lista) :-
    length(Lista, Longitud).

% Ejemplo de uso
ejemplo :-
    Listas = [[1, 2], [3, 4, 5], [6], [7, 8, 9, 10], [11, 12], [13, 14, 15]],
    ordenar_por_frecuencia(Listas, Resultado),
    write('Lista de listas ordenada por frecuencia de longitud:'), nl,
    mostrar(Resultado).

% Mostrar las listas
mostrar([]).
mostrar([Sublista|Resto]) :-
    write(Sublista), nl,
    mostrar(Resto).
