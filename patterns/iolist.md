Name:     IO List
Scope:    Erlang/OTP Construct
Summary:  Use deeply nested lists of integers and binaries to represent IO data
          to avoid copying when concatenating strings or binaries.

IO lists are typically used to build output to a port e.g. a file or network
socket.

```
file:write_file("myfile.txt", ["Hi " [<<"there">>], $\n]).
```

They are efficient even when combining large amounts of data.  For
example combining two fifty kilobyte binaries using binary syntax
`<<B1/binary, B2/binary>>` would typically require reallocating both into a new
100kb binary.  Using IO lists `[B1, B2]` only allocates the list, in this case three
words.  A list uses one word and another word per element, see [here](http://www.erlang.org/doc/efficiency_guide/advanced.html#id68923) for
more information.

Another benefit of using IO lists is that they can combine data from functions
that produce strings or binaries without converting the type. This cuts down on
errors mistakenly converting to or from the wrong type.

**Add** the allowed data types to the front of an IO list, creating a new one.

```
["Guten Tag " | [<<"Hello">>]].
[<<"Guten Tag ">> | [<<"Hello">>]].
[$G, $u, $t, $e, $n , $T, $a, $g | [<<"Hello">>]].
[71,117,116,101,110,84,97,103,<<"Hello">>].
```

IO data can be efficiently added to the **end** of a list.

```
Data_1 = [<<"Hello">>].
Data_2 = [Data_1,<<" Guten Tag ">>].
```

Using the `++` operator would have created a whole new list, instead
of just a new two element list.  Recreating lists to add elements to
the end can become expensive when the list is long.

Be careful not to create an **improper list**.

```
["Guten tag " | <<"Hello">>].
```

In the shell this will be printed as `["Guten tag "|<<"Hello">>]` instead of
`["Guten tag ",<<"Hello">>]`. The pipe operator will create an improper list 
if the last element on the right is not a list.  Improper lists can cause 
issues because many recursive functions expect an empty list to be the last
element, and not, as in this case a binary.

The **size** of an iolist can be calculated using the `iolist_size/1`.  This snippet 
calculates the size of a message and creates and appends it to the front as a four
byte binary. This is a typical operation in messaging protocols.

```
Data = ["Guten tag ",<<"Hello">>],
Len = iolist_size(Data),
[<<Len:32>> | Data].
```

An IO list can be converted to a binary using the `iolist_to_binary/1` function.
If the data is going to be stored for a long period or sent as a message to other
processes then it may make sense to convert it to a binary. The one off cost of
converting to a binary can be cheaper than copying the IO list many times, in
garbage collection of a single process or in message passing to others.

```
<<"Guten tag, Hello">> = iolist_to_binary(["Guten tag, ",<<"Hello">>]).
```

In cases where the binary data is small, allocating IO lists can be greater than
appending the binaries. If the binary data can either be small or large it is often
better to accept the consistent cost of IO lists.

Note that appending binaries is optimised as described 
[here](http://www.erlang.org/doc/efficiency_guide/binaryhandling.html).  In 
short, a binary can have extra, hidden space allocated. This will be filled if another
binary is appended to it that fits in the free space.  This means that not every
binary append will cause a full copy of both binaries.