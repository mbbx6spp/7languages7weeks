%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
character(brian).
character(jinx).

species(brian, dog).
species(jinx, cat).

class(dog, mammal).
class(cat, mammal).

animal(X) :- species(X, Y).
is_a(X, Z) :- species(X, Y), class(Y, Z).
																																																																																		