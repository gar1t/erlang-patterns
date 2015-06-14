Name:     Accumulator
Scope:    Function Type
Summary:  A recursive function can be used to build a list.

Creating a list is one of the more common functions in a program. The
_accumulator_ pattern uses a recursive function to build a list by
adding items to the head of a list. It's common to reverse the list as
a final step in the process.

Here's an example that creates a sequential list of integers.

```erlang
{% example file="accumulator.erl" lines="5-10" %}
```

The _accumulator_ has an exit condition that indicates when the
accumulation is finished. In this case, the list is finished when
`Start` is greater than or equal to `Finish`.
