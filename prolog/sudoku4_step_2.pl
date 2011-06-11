%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
sudoku(Puzzle, Solution) :-
        Solution = Puzzle, 
        Puzzle = [S11, S12, S13, S14, 
                  S21, S22, S23, S24, 
                  S31, S32, S33, S34, 
                  S41, S42, S43, S44], 
        fd_domain(Puzzle, 1, 4).
        
