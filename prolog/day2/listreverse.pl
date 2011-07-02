% Very similar to the accumulator idiom in Erlang

% reverse_list/2
reverse_list(List, Reversed) :- reverse_list(List, [], Reversed).

% reverse_list/3
reverse_list([], Reversed, Reversed).
reverse_list([Head|Tail], Acc, Reversed) :- reverse_list(Tail, [Head|Acc], Reversed).
