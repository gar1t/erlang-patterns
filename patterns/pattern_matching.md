Name:     Pattern Matching
Scope:    Function Type
Summary:  Control flow via pattern matching, rather than if/case/cond.

Rather than taking in one or more parameters to a function and then 
determining how to handle them using traditional flow control constructs
inside a given function, when feasible, use multiple function definitions
with pattern matching (and/or guard expressions) to allow the internal
logic of each function definition to be simpler and clearer.

Here's an example that accomplishes flow control with a _case_ construct
inside a single function definition:

```erlang
{% example file="flow_control.erl" lines="6-10" %}
```

Here's an example that instead splits the same logic into multiple function
definitions, making use of pattern matching:

```erlang
{% example file="flow_control.erl" lines="13-14" %}
```

