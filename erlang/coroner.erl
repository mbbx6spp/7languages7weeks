%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
-module(coroner).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true), 
    receive
        {monitor, Process} -> 
            link(Process), 
            io:format("Monitoring process.~n"),
            loop();
            
        {'EXIT', From, Reason} -> 
            io:format("The shooter ~p died with reason ~p.", [From, Reason]),
 			io:format("Start another one.~n"), 
            loop()
        end.