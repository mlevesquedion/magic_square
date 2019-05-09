:- module(magic_square,
          [ solve/2
          ]).

:- use_module(range_utils).
:- use_module(square_utils).

take(0, _, []).
take(N, [H|T], Taken) :-
    N1 is N-1,
    take(N1, T, Rest),
    Taken=[H|Rest].

drop(0, Elements, Elements).
drop(N, [_|T], Remaining) :-
    N1 is N-1,
    drop(N1, T, Remaining).

chunk([], _, []).
chunk(Elements, N, Chunks) :-
    take(N, Elements, Chunk),
    drop(N, Elements, Rest),
    chunk(Rest, N, OtherChunks),
    Chunks=[Chunk|OtherChunks].

solve(Size, Square) :-
    Sum is Size*Size,
    numlist(1, Sum, Elements),
    permutation(Elements, Permutation),
    magic_square:chunk(Permutation, 3, Square),
    rows(Square, Rows),
    columns(Square, Columns),
    diagonals(Square, Diagonals),
    all_unique(Square),
    all_same_sum([Rows, Columns, Diagonals]).