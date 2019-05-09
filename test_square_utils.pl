:- use_module(square_utils).
:- use_module(test).

square([[1, 2, 3], [4, 5, 6], [7, 8, 9]]).

cols([[1, 4, 7], [2, 5, 8], [3, 6, 9]]).

diags([[1, 5, 9], [3, 5, 7]]).

:- test("rows", [(square(Square), rows(Square, Square))]).

:- test("columns",
        [(square(Square), cols(Columns), columns(Square, Columns))]).

:- test("diagonals",
        [(square(Square), diags(Diagonals), diagonals(Square, Diagonals))]).

:- halt.