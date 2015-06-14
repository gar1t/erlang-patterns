-module(accumulator).

-export([seq/2]).

seq(Start, Finish) -> seq(Start, Finish, []).

seq(Start, Finish, Acc) when Start =< Finish ->
    seq(Start + 1, Finish, [Start|Acc]);
seq(_, _, Acc) ->
    lists:reverse(Acc).
