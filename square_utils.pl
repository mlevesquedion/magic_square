:- module(square_utils,
          [ all_same_sum/1,
            rows/2,
            columns/2,
            diagonals/2
          ]).
:- use_module(functools).

sum_lists([], []).
sum_lists([H|T], Sums) :-
    sum_list(H, Sum),
    sum_lists(T, OtherSums),
    Sums=[Sum|OtherSums].

all_same_sum(Candidates) :-
    map(square_utils:sum_lists, Candidates, Sums),
    flatten(Sums, Flat),
    list_to_set(Flat, Set),
    length(Set, 1). 

rows(Square, Square).

columns([[]|_], []).
columns(Rows, Columns) :-
    map(functools:head, Rows, Firsts),
    map(functools:tail, Rows, Tails),
    columns(Tails, TailFirsts),
    Columns=[Firsts|TailFirsts].

diagonals(Rows, Diagonals) :-
    map(reverse, Rows, Mirrored),
    square_utils:diagonal(0, Rows, NormalDiag),
    square_utils:diagonal(0, Mirrored, MirroredDiag),
    Diagonals=[NormalDiag, MirroredDiag].

diagonal(_, [], []).
diagonal(N, [H|T], Diagonal) :-
    nth0(N, H, Nth),
    N1 is N+1,
    square_utils:diagonal(N1, T, TailDiagonal),
    Diagonal=[Nth|TailDiagonal].
