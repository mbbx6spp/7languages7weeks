-module(day1_tests).

-include_lib("eunit/include/eunit.hrl").

count_words_cheating_test() ->
  String = "What are you up to today?",
  ?assertEqual(6, day1:count_words_cheating(String)),
  BuggyString = "What  are you up to today?",
  ?assertEqual(6, day1:count_words_cheating(BuggyString)).

count_words_recursive_test() ->
  String = "What are you up to today?",
  ?assertEqual(6, day1:count_words_recursive(String)),
  BuggyString = "What  are you up to today?",
  ?assertEqual(6, day1:count_words_recursive(BuggyString)).

count_to_test() ->
  % TODO: How to test without introducing meck as a dependency?
  fail.

success_or_error_test() ->
  ok = day1:success_or_error(success),
  ok = day1:success_or_error({error, "My awesome error message"}),
  ?assertError(function_clause, day1:success_or_error(other_term)),
  % TODO: How to test print outs of these messages without meck dependency?
  ok.


