%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
-module(doctor).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true), 
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(revolver, spawn_link(fun roulette:loop/0)),
            loop();
        
        {'EXIT', From, Reason} -> 
            io:format("The shooter ~p died with reason ~p.", [From, Reason]),
			io:format(" Restarting. ~n"),
            self() ! new, 
            loop()
        end.