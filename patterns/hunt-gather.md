Name:     Hunt Gather
Scope:    Vanilla Erlang
Summary:  Use them cores. Parallelizing a list of work with the goal
          of avoiding sequentiality.

This pattern parallelizes work which can save time and utilize
hardware. Wherever there is work to be done which has no restriction
for the order of operations, the hunt-gather pattern can be employed. 
          
```
-module(foo).

-export([start/0]).

start() ->
    Work = lists:seq(1, 999), % proxy for a list of actual data
    Cnt  = length(Work),
    hunt(Work),
    gather(Cnt, []).

hunt(L) ->
    Parent = self(),
    Fn     = fun faux_expensive_routine/2,
    [ spawn(fun() -> Fn(Parent, X) end) || X <- L ].

gather(0, Acc) -> Acc;
gather(K, Acc) ->
    receive
        {bounty, R} -> gather(K - 1, [R|Acc])
    end.

faux_expensive_routine(Parent, _X) -> 
    timer:sleep(3000),
    R = gathered, % usually do something with _X
    Parent ! {bounty, R}.
```
