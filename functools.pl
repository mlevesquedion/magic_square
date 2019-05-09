:- module(functools,
          [ head/2,
            tail/2,
            map/3,
            map2/4,
            foldR/4,
            all/2
          ]).

head([H|_], H).
tail([_|T], T).

map(_, [], []).
map(F, [H|T], [H1|T1]) :-
    call(F, H, H1),
    map(F, T, T1).

map2(_, _, [], []).
map2(F, X, [H|T], [H1|T1]) :-
    call(F, X, H, H1),
    map2(F, X, T, T1).

foldR(_, [], Acc, Acc).
foldR(F, [H|T], Init, R) :-
    foldR(F, T, Init, Acc),
    call(F, H, Acc, R).

all(_, []).
all(P, [H|T]) :-
    call(P, H),
    all(P, T).