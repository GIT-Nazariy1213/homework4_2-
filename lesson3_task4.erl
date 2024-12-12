-module(lesson3_task4).
-export([decode/2]).

decode(Json, Format) when is_binary(Json) ->
    try jsx:decode(Json, [return_maps]) of
        Parsed -> convert(Parsed, Format)
    catch
        _: _ -> {error, invalid_json}
    end;
decode(_, _) ->
    {error, invalid_input}.

convert(Map, map) when is_map(Map) -> Map;
convert(Map, proplist) when is_map(Map) -> maps:to_list(Map);
convert(Proplist, proplist) when is_list(Proplist) -> Proplist;
convert(Proplist, map) when is_list(Proplist) -> maps:from_list(Proplist).