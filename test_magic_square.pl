:- use_module(range_utils).
:- use_module(square_utils).
:- use_module(magic_square).
:- use_module(test).

is_square([]).
is_square(Square) :-
    rows(Square, Rows),
    columns(Square, Columns),
    diagonals(Square, Diagonals),
    length(Square, Length),
    length(Rows, Length),
    length(Columns, Length),
    all_unique(Square),
    all_same_sum([Rows, Columns, Diagonals]).

:- test("solve",
        
        [ is_square([[2, 7, 6], [9, 5, 1], [4, 3, 8]]),
          (solve(3, Solution), is_square(Solution))
        ]).

:- halt.