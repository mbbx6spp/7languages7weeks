minimum(X, Y, X) :- X =< Y.
minimum(X, Y, Y) :- Y =< X.

list_min([], 0).
list_min([Head|Tail], Min) :- 
  integer(Head), minimum(Head, Min, Min), list_min(Tail, Head, Min).

list_min([], Min, Min).
list_min([Head|Tail], Elem, Min) :- 
  integer(Head), 
  minimum(Head, Min, Min), 
  minimum(Head, Elem, Head), 
  list_min(Tail, Head, Min).
list_min([_|Tail], Elem, Min) :- 
  list_min(Tail, Elem, Min).
