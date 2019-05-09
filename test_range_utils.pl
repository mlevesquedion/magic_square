:- use_module(test).
:- use_module(range_utils).

:- test("all_unique",
        [all_unique([[1, 2, 3], [4, 5, 6, 7], [8, 9], []]), not(all_unique([[1], [1]]))]).

:- halt.