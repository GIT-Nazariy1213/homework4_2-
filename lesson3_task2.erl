-module(lesson3_task2).
-export([words/1]).

words(BinText) ->
    lists:filter(fun(X) -> X =/= <<>> end, binary:split(BinText, <<" ">>, [global])).
    