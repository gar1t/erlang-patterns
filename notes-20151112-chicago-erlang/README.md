# Mailboxes - Messaging

Ideas of message buses. Simple constructs related to messaging,
mailboxes. Ability to signal.

Familiarity of the constructs from experience with OS constructs.

# Congruence with System Coordination

Semantics didn't work against instinct of messaging / signal bases systems.

# Fault Tolerance via Fault -> Death -> Restart

The central premise of Erlang's fault tolerance.

# Discoverability of root causes

Uncertainty of "let it crash" and "restart" as a correct solution for
all cases demands a facility to discover root causes in support of
"correct software".

# Ability to ignore errors freeing

Like not having to spend days on tracking down a bug that may never
occur again, or is hard to reproduce.

# Learning from Experience

How to put code into production that isn't "done" or 100% tested,
correct, etc. and learn from real world experience without killing
your app.

"The perfect being the enemy of the good."

# Syntax Different

Different from more familiar languages.

# Spatial Relationships in Erlang

Who's calling what and where? What's going on?

# Incongruence between code structure and runtime behavior

Looking for some cues in the code - the modules, files, functions,
etc. to understand what happens at runtime. Consider classes, which
isolate state and functions, which corresponds to the runtime
behavior.

# Records are too thin as an abstraction

"The compiler should be helping me more."

# What is the standard way of doing this?

Uncertainty and nervousness about an approach that works but may not
be "the right way" in Erlang.

# Process abstraction as finite state machine

Use case is a "debouncer". A process allows a focus on input and
output with isolated logic for maintaining associated state.

Simplifies signal processing.

# Natural application of processes to experience

Comparable to "classes" and objects.

# Strict vs Flexible

This is related to message passing and handling. The decoupling of
"calls" by way of messages passed via queues, allows for a more
flexible communication scheme.

Being flexible in how you handle messages allows for lose coupling
and, possibly, more resilient behavior.
