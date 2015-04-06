Name:     Case Expression
Scope:    Erlang/OTP Construct
Summary:  Use a case expression to define a conditional value based on
          a term.

A case expression evaluates an expression against a series of patterns and optional guard sequences. The body of the first pattern/guard sequence that matches is evaluated and is the result of the case expression.

In the following example, if Dir is a directory, the return from the function will be the count of its files. Otherwise, the return will be 0.

```
count_files(Dir) ->
  case filelib:is_dir(Dir) of
    true ->
      {ok, Files} = file:list_dir(Dir),
      length(Files);
    false ->
      0
  end.
```
