Name:     Department
Scope:    Application Level Facility
Summary:  A common setup for supervisor, worker that allows proper escalation of failures.

The department pattern consists of a supervisor for the department (subsystem) with a one for all strategy (AND tree). Under this department supervisor are two children a manager process responsible for orchestrating what happens in the department and a worker supervisor which can have either a one for one (OR tree) or a one for all (AND tree) strategy. The manager asks its sibling process (the worker supervisor) to spawn new workers as needed and potentially to restart them automatically should something fail.

This pattern supports Agile software development because it defers implementation of monitoring in the manager process. It also ensures the failures are properly escalated.

In order to select the initial intensity (MaxR) and period (MaxT) values for the supervisors. It is a good idea to manually crash the processes and observe the behavior and to tweak the values accordingly.

