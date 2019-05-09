:- module(range,
          [ all_unique/1
          ]).

all_unique(Square) :-
    flatten(Square, Flat),
    msort(Flat, Sorted),
    is_set(Sorted).
