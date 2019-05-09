:- module(test,
          [ test/2
          ]).

test(Name, Tests) :-
    (   write(Name),
        write(': '),
        flush_output,
        run_tests(Tests),
        nl
    ;   nl
    ).

run_tests([]).
run_tests([Head|Tail]) :-
    run_test(Head),
    run_tests(Tail).

run_test(Test) :-
    (   Test,
        write('.'),
        flush_output
    ;   write(x),
        flush_output
    ).