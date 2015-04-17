Name:     Accumulator
Scope:    Function Type
Summary:  A recursive function can be used to build a list result by
          appending to a working list head.
Example implementation:

<pre><code class="language-erlang">
%% File: accumulator.erl %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(accumulator).
-export([sum/1, prod/1]).


%% Using recursive function
%% Example: Sum list of numbers
%% Usage:
%% MySum = accumulator:sum([2,4,6,8]).
%% MySum is now 20

sum(List) ->
    sum(List, 0). % Zero is the initial value for accumulator

sum([Head|Tail], Acc) ->
    sum(Tail, Head + Acc); % Next call receive accumulator plus Head number
sum([], Acc) ->
    Acc.


%% Using the lists module
%% Example: Product of all elements inside list
%% Usage:
%% MyProd = accumulator:prod([2,4,6,8]).
%% MyProd is now 384

prod(List) ->
    Accumulator = 1, % Because it's a product, accumulator begins with 1
    lists:foldl(fun(N, Acc) -> N * Acc end, Accumulator, List).
</code></pre>
