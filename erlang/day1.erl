-module(day1).

-export([count_words_cheating/1, count_words_recursive/1, 
    count_to/1, success_or_error/1]).

-define(PRINT, fun (Format, Terms) ->
      error_logger:info_msg(Format, Terms)
  end).

%% @doc Count words in a given String. Assumes that 
%%      the space character is the word separator (naive).
%%      This non-recursive implementation is to show the  
%%      module in the stdlib.
-spec count_words_cheating(String) -> N when
  String :: string(),
  N :: integer().
count_words_cheating(String) ->
  length(string:tokens(String, " ")).


%% @doc Count words in a given String. Assumes that
%%      the space character is the word separator (naive).
%%      This is the recursive implementation.
%%      Note: this contains a bug with consequtive spaces!
-spec count_words_recursive(String) -> N when
  String :: string(),
  N :: integer().
count_words_recursive(String) ->
  count_words_recursive(String, 1).

count_words_recursive([], Count) -> Count;
count_words_recursive([Char | Rest], Count) ->
  case Char of
    32 -> count_words_recursive(Rest, Count+1);
    _ -> count_words_recursive(Rest, Count)
  end.

%% @doc Count to ten recursively.
-spec count_to(N) -> ok when N :: integer().
count_to(N) ->
  count_to(N, N-1).

count_to(_, -1) -> ok;
count_to(N, BackCounter) ->
  ?PRINT("~w~n", [N - BackCounter]),
  count_to(N, BackCounter - 1).

%% @doc Implement a function with two clauses
-spec success_or_error(Term) -> ok when 
  Message :: string(),
  Term :: success | {error, Message}.
success_or_error(Term = success) ->
  ?PRINT("~w~n", [Term]);
success_or_error({error, Message}) ->
  ?PRINT("error: ~s~n", [Message]).
