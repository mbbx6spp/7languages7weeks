% Solving list minimum exercise
% Using accumulator idiom commonly found (and probably borrowed from Prolog and 
% older languages) in Erlang (my main current language).

% minimum/3
minimum(X, Y, X) :- X =< Y.
minimum(X, Y, Y) :- Y =< X.

% list_min/2
list_min([], 0).
list_min([Head|Tail], Min) :- 
  integer(Head), minimum(Head, Min, Min), list_min(Tail, Head, Min).

% list_min/3
list_min([], Min, Min).
list_min([Head|Tail], Elem, Min) :- 
  integer(Head), % check that Head is an integer as an extra check 
  minimum(Head, Min, Min), % check that head is not less than expected minimum
  minimum(Head, Elem, Head), % check if head is less than current leading minimum
  list_min(Tail, Head, Min).
list_min([_|Tail], Elem, Min) :- 
  list_min(Tail, Elem, Min).
