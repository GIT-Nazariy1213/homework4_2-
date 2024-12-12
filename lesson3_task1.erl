-module(lesson3_task1).
-export([first_word/1]).

first_word(BinText) ->
    case binary:match(BinText, <<" ">>) of
        {Pos, _} -> binary:part(BinText, 0, Pos);
        nomatch -> BinText
    end.