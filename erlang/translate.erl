%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
-module(translate).
-export([loop/0]).

loop() ->
    receive
        "casa" -> 
            io:format("house~n"), 
            loop();
        
        "blanca" -> 
            io:format("white~n"), 
            loop();
        
        _ -> 
            io:format("I don't understand.~n"), 
            loop()
        
end.