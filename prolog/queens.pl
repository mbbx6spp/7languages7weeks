%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
valid_queen((Row, Col)) :- 
    Range = [1,2,3,4,5,6,7,8], 
    member(Row, Range), member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail). 
    
rows([], []).
rows([(Row, _)|QueensTail], [Row|RowsTail]) :- 
  rows(QueensTail, RowsTail).
  
cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :- 
  cols(QueensTail, ColsTail).
  
diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- 
  Diagonal is Col - Row, 
  diags1(QueensTail, DiagonalsTail).

diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- 
  Diagonal is Col + Row, 
  diags2(QueensTail, DiagonalsTail).

eight_queens(Board) :- 
  length(Board, 8),
  valid_board(Board), 

  rows(Board, Rows), 
  cols(Board, Cols), 
  diags1(Board, Diags1), 
  diags2(Board, Diags2), 
  
  fd_all_different(Rows),   
  fd_all_different(Cols), 
  fd_all_different(Diags1),   
  fd_all_different(Diags2).