Name: Abstract Execution Scope: Principle Summary: Describe impure logic as abstract data representing that logic, to be executed separately.

Sometimes a function needs to perform side-effectful or otherwise complicated logic (making network requests, reading / writing to a database, manipulating the filesystem, caching, batching, etc). This can make the function difficult to reason about by conflating its purpose with its implementation. For example, while caching and batching may make a function more efficient, they may not be required in order for the function to be correct.

Instead, write the function as two separate functions:
1) A function that returns a high-level, declarative description of the desired logic
2) A function that interprets that description and executes it

It then becomes possible to separately reason about the high-level goals of a program and the mechanism by which those goals are achieved. Moreover, it becomes possible to test both concerns in isolation, and to increase the complexity of the interpreter without increasing the complexity of the functions which make use of it.

Examples:
- `Ecto.Multi` - https://hexdocs.pm/ecto/Ecto.Multi.html
- `Haxl` - https://github.com/facebook/Haxl
