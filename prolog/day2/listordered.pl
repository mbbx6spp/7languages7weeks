% Thought I would need to use this for sorting, but didn't.

% ordered/1
ordered([]). % assume empty list is considered ordered
ordered([_]).
ordered([X,Y|List]) :- X < Y, ordered([Y|List]).
