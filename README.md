Practica 2

Integrantes
- Simon Alzate Rojas
- Juan Esteban Grajales

Como copilar
g++ -std=c++17 -Wall -Wextra -o practice main.cpp
./practice

El programa compila sin errores y sin warnings, en OnlineGDB seleccionas el lenguaje C++17, pegas el main.cpp completo y le das Run

Preguntas

¿Que pasa si el destructor de TransportMode no es virtual?

si el destructor de TransportMode no fuera virtual al eliminar un objeto de una clase hija mediante un puntero de la clase padre no se garantizaría que se ejecute correctamente el destructor de la clase hija, esto puede causar problemas al liberar memoria o recursos.

¿Por qué es mejor usar una clase abstracta con funciones virtuales puras en lugar de un enum y un switch?

porque con una clase abstracta cada transporte puede tener sus propias funciones y tarifas sin tener que modificar todo el código, pero con un enum y un switch tendríamos que agregar más condiciones cada vez que se cree un nuevo transporte lo que puede generar más errores.

¿Qué ventajas tiene usar algoritmos STL con lambdas en lugar de ciclos hechos manualmente?

los algoritmos STL nos permiten hacer operaciones como ordenar, contar o sumar elementos sin tener que escribir los ciclos manualmente. Esto hace que el código sea más corto, fácil de entender y mantener además de reducir la posibilidad de cometer errores al recorrer los datos.