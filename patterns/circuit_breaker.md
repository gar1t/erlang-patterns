Name:     Circuit Breaker
Scope:    Application Level Facility
Summary:  A mechanism to prevent queue overflow and allow the system to fail fast. Circuit breaker is used to detect failures and encapsulates logic of preventing a failure to reoccur constantly (during maintenance, temporary external system failure or unexpected system difficulties). This pattern can be useful for graceful degradation of a service. 

A circuit breaker usually has a 3 values (but could be more advanced).
A number of retries before melting the fuse. A time period to reset
the number of retries and a cooldown period to reset the fuse.

For examples see the https://github.com/jlouis/fuse library.

