
% Practica 1 - (Prolog) - Codigo del carnet EAFIT



:- initialization(main).


descomponer(Codigo, Periodo, Cat, Cons) :-
    integer(Codigo),
    Codigo >= 10000000, Codigo =< 99999999,   
    Periodo is Codigo // 100000,              
    Resto is Codigo mod 100000,
    Cat is Resto // 1000,                     
    Cons is Resto mod 1000.                   


componer(Periodo, Cat, Cons, Codigo) :-
    Codigo is Periodo * 100000 + Cat * 1000 + Cons.


periodo_valido(Periodo, Anio, Semestre) :-
    Periodo >= 262, Periodo =< 292,
    
    Semestre is Periodo mod 10,
    member(Semestre, [1, 2]),         
    Anio is 2000 + Periodo // 10.



divisor(N, D) :- between(1, N, D), D < N, N mod D =:= 0.


aliquota(N, Suma) :-
    findall(D, divisor(N, D), Divisores),
    sum_list(Divisores, Suma).


abundante(N)  :- aliquota(N, S), S > N.
perfecto(N)   :- aliquota(N, S), S =:= N.
deficiente(N) :- aliquota(N, S), S < N.

categoria(N, 'Administrativa') :- abundante(N).
categoria(N, 'Ingenieria')    :- perfecto(N).
categoria(N, 'Humanidades')     :- deficiente(N).


paridad(N, even) :- N mod 2 =:= 0.
paridad(N, odd)  :- N mod 2 =:= 1.


carnet(Codigo, Descripcion) :-
    descomponer(Codigo, Periodo, Cat, Cons),
    Cat >= 1, Cat =< 99,
    Cons >= 1, Cons =< 999,
    periodo_valido(Periodo, Anio, Sem),
    categoria(Cat, Tipo),
    paridad(Cons, Par),
    format(atom(Descripcion), '~d-~d ~w num~d ~w', [Anio, Sem, Tipo, Cons, Par]).


probar(Codigo) :-
    ( carnet(Codigo, D)
    -> format('~d -> ~w~n', [Codigo, D])
    ;  format('~d -> codigo invalido~n', [Codigo]) ).

main :-
    writeln('Ejemplos del enunciado '),
    probar(26276002), probar(27128112), probar(27206025),
    probar(28124236), probar(28299115),

    nl, writeln('Codigos invalidos '),
    probar(9999999),    
    probar(26376002),   
    probar(30076002),   

    nl, writeln(' Verificar (todo instanciado se comprueba por unificacion) '),
    ( carnet(26276002, '2026-2 Humanidades num2 par')
    -> writeln('26276002 SI corresponde a esa descripcion')
    ;  writeln('no corresponde') ),

    nl, writeln(' Generar: codigos de 2029-2, Ingenieria, consecutivo 1'),
    findall(Codigo,
        ( between(1, 99, Cat), categoria(Cat, 'Ingenieria'),
          componer(292, Cat, 1, Codigo) ),
        Codigos),
    writeln(Codigos).
