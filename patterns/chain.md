Name:     Chain
Scope:    Function/Wrapper
Summary:  Connect a bunch of functions passing the returned value of each
          function to the next one. The last function's return value is
          the chain's return value.

There are different possible ways of breaking from the chain:

* Throw an exception.

* Shortcut by returning some special value. For example, return
 ```{ok, Value}``` or ```{error, Error}``` in each function inside
 the chain.

* Just let any values pass through and let the code crash if some
 garbage gets into a function.

Examples:

```
-module(chain).

-export([naive/2, error_monad/2]).

naive([], Arg) ->
    Arg;
naive([Fun | Funs], Arg) ->
    naive(Funs, Fun(Arg)).

error_monad([], Arg) ->
    Arg;
error_monad([Fun | Funs], Arg) ->
    case Fun(Arg) of
        {ok, V} ->
            error_monad(Funs, V);
        {error, E} ->
            {error, E}
    end.
```
