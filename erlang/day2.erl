-module(day2).

-export([get_value/2, item_totaller/1, tictactoe_winner/1]).

-define(TICTACTOE_LINES, 
  fun({R1 = {A1, B1, C1}, R2 = {A2, B2, C2}, R3 = {A3, B3, C3}}) ->
      [ R1, R2, R3, {A1, B2, C3}, {A3, B2, C1},
        {A1, A2, A3}, {B1, B2, B3}, {C1, C2, C3} ]
  end).

%% @doc retrieves the value from given list for the given tuple "key".
-spec get_value(List, Key) -> undefined | Result when
  List :: list(),
  Key :: atom(),
  Result :: term().
get_value([], _) ->
  undefined;
get_value([ {Key, Value} | _Rest ], Key) ->
  Value;
get_value([ _ | Rest ], Key) ->
  get_value(Rest, Key).

%% @doc totals price per grocery list item type based on quantity
-spec item_totaller(ShoppingList) -> PriceList when
  ShoppingList :: {ItemType, Quantity, Price},
  ItemType :: atom(),
  Quantity :: integer(),
  PriceList :: {ItemType, Price},
  Price :: float(). % price as float: bad idea for real world!
item_totaller(ShoppingList) ->
  [ {ItemType, Quantity*UnitPrice} || 
    {ItemType, Quantity, UnitPrice} <- ShoppingList ].

%% @doc returns the winner of a Tic Tac Toe board or draw if no winner.
-spec tictactoe_winner(Matrix) -> x | o | draw when
  Matrix :: { MatrixRow, MatrixRow, MatrixRow },
  MatrixRow :: { MatrixCell, MatrixCell, MatrixCell },
  MatrixCell :: x | o | ' '.
tictactoe_winner(Matrix) ->
  Lines = ?TICTACTOE_LINES(Matrix),
  WinningLines = [ {X, Y, Z} || {X, Y, Z} <- Lines, X =:= Y, Y =:= Z ],
  case WinningLines of
    [] -> draw;
    [{V, V, V}|_] -> V
  end.
