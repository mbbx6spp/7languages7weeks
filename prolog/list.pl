%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
head(Head, [Head|Tail]). 
tail(Tail, [Head|Tail]).

beginning(Top, List) :- head(Top, List).

end(Head, [Head|[]]).
end(End, [Head|Tail]) :- end(End, Tail).

includes(Head, [Head|Tail]).
includes(Item, [Head|Tail]) :- includes(Item, Tail).