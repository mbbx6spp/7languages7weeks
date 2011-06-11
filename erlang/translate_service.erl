%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
-module(translate_service).
-export([loop/0, translate/2]).

loop() ->
    receive
        {From, "casa"} -> 
            From ! "house", 
            loop();
        
        {From, "blanca"} -> 
            From ! "white", 
            loop();
        
        {From, _} -> 
            From ! "I don't understand.", 
            loop()
        
end.

translate(To, Word) ->
    To ! {self(), Word}, 
    receive
        Translation -> Translation
    end.

