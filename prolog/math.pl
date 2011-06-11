%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
factorial(0, 1).
factorial(Index, Fac) :- 
	Index > 0, 
	OneBack is Index - 1, 
	factorial(OneBack, PreviousFac), 
	Fac is PreviousFac * Index.

fib(1, 1).
fib(2, 1).
fib(Index, Value) :- 
	Index > 2, 
	Previous is Index - 1,
	PreviousPrevious is Index - 2, 
	fib(Previous, X), 
	fib(PreviousPrevious, Y), 
	Value is X + Y.
