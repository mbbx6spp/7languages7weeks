-module(day2_tests).

-include_lib("eunit/include/eunit.hrl").

-compile([export_all]).

-define(EMPTY, []).

get_value_test() ->
  PropListWithAandB = [{a, "apples"}, {b, "bananas"}],
  PropListWithC = [{c, "cantelopes"}],
  PropListWithADups = [{a, "apples"}, {a, "apricots"}],
  ?assertEqual("apples", day2:get_value(PropListWithAandB, a)),
  ?assertEqual("bananas", day2:get_value(PropListWithAandB, b)),
  ?assertEqual(undefined, day2:get_value(?EMPTY, a)),
  ?assertEqual(undefined, day2:get_value(PropListWithAandB, c)),
  ?assertEqual("cantelopes", day2:get_value(PropListWithC, c)),
  ?assertEqual("apples", day2:get_value(PropListWithADups, a)),
  ?assertEqual("apricots", day2:get_value(lists:reverse(PropListWithADups), a)).

item_totaller_test() ->
  ShoppingList = [
    {bread_loaf, 1, 1.89}, % with beans in - yeah, you know the ones!
    {bagel, 7, 0.59}, % delicious cheesy bagels, yum!
    {sixpack, 2, 6.99}, % yes, I get the cheap stuff, so what?
    {asparagus, 2, 1.99}, % per lb
    {cucumbers, 3, 2.99}, % per stick
    {chocolate_bars, 5, 0.99}
  ],
  ExpectedPrices = [
    {bread_loaf, 1.89},
    {bagel, 7*0.59},
    {sixpack, 2*6.99},
    {asparagus, 2*1.99},
    {cucumbers, 3*2.99},
    {chocolate_bars, 5*0.99}
  ],
  ?assertEqual(ExpectedPrices, day2:item_totaller(ShoppingList)).

tictactoe_winner_test() ->
  XWins = {
    {x, o, ' '},
    {x, x, o},
    {x, o, ' '}
  },
  OWins = {
    {o, o, o},
    {' ', x, x},
    {' ', ' ', x}
  },
  Unfinished = {
    {x, ' ', ' '},
    {' ', o, ' '},
    {' ', ' ', x}
  },
  Tie = {
    {o, x, o},
    {x, x, o},
    {x, o, x}
  },
  ?assertEqual(x, day2:tictactoe_winner(XWins)),
  ?assertEqual(o, day2:tictactoe_winner(OWins)),
  ?assertEqual(draw, day2:tictactoe_winner(Unfinished)),
  ?assertEqual(draw, day2:tictactoe_winner(Tie)).
