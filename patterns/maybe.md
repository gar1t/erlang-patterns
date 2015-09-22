Name:     Maybe
Scope:    Function Type
Summary:  Perform an operation only if its arguments meets some criteria.

One way to implement this is using pattern matching with the criteria executed in the caller:

```erlang
maybe_cache(Key, Value, true) ->
  cache:put(Key, Value),
  Value;
maybe_cache(Key, Value, false) ->
  Value.

%% Elsewhere
handle(Message) ->
  maybe_cache(Message#id, Message, Message#cacheable).
```
