%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
different(red, green). different(red, blue). 
different(green, red). different(green, blue). 
different(blue, red). different(blue, green). 

coloring(Alabama, Mississippi, Georgia, Tennessee, Florida) :-
  different(Mississippi, Tennessee), 
  different(Mississippi, Alabama), 
  different(Alabama, Tennessee), 
  different(Alabama, Mississippi), 
  different(Alabama, Georgia), 
  different(Alabama, Florida), 
  different(Georgia, Florida), 
  different(Georgia, Tennessee). 
  
