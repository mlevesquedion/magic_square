:- use_module(functools).
:- use_module(test).

mulTwo(X, X2) :-
    X2 is X*2.
mulBy(X, Y, Z) :-
    Z is X*Y.
isEven(X) :-
    X mod 2=:=0.
add(X, Y, Z) :-
    Z is X+Y.
cons(H, T, [H|T]).

:- test("map", [map(mulTwo, [1, 2, 3], [2, 4, 6])]).

:- test("map2", [map2(mulBy, 2, [1, 2, 3], [2, 4, 6])]).
:- test("foldR", [foldR(add, [1, 2, 3], 0, 6), foldR(cons, [1, 2, 3], [], [1, 2, 3])]).

:- test("all", [all(isEven, [0, 2, 4]), not(all(isEven, [0, 1, 2]))]).

:- halt.