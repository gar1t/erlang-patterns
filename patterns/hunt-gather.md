Name:     Hunt Gather
Scope:    Vanilla Erlang
Summary:  Use them cores. Parallelizing a list of work with the goal
          of avoiding sequentiality.
          
```
-module(foo).

-export([start/1]).

start(N) when N > 1, N < 101 ->
    L      = lists:seq(1, N), % proxy for a list of actual data
    Cnt    = length(L),
    Parent = self(),
    [ spawn(fun() -> hunt(Parent, X) end) || X <- L ],
    gather(Cnt, []).

hunt(Pid, _X)   -> % usually pass in _X to the expensive function
    Res = faux_expensive_routine(),
    Pid ! {result, Res}.

gather(0, Acc) -> Acc;
gather(K, Acc) ->
    receive
        {result, R} -> gather(K - 1, [R|Acc])
    end.

faux_expensive_routine() -> 
    timer:sleep(3000),
    foo.
```
