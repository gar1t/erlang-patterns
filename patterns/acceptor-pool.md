Name:     Acceptor Pool
Scope:    Application Level Facility
Summary:  A pool of acceptors can be used to reduce the latency of
          inbound connections.

Given a collection of workers, usually started as part of the socket listening module:

```erlang
-record(state, {workers}).

init([NumWorkers]) ->
  {ok, #state{workers = make_workers(queue:new(), NumWorkers)}}.

make_workers(Queue, NumWorkers) ->
  make_workers(Queue, NumWorkers, 1).
make_workers(Queue, NumWorkers, N) ->
  case N < NumWorkers of
    true ->
      {ok, WorkerPid} = ?WORKER:start_link([]),
      make_workers(queue:in(WorkerPid, Queue), NumWorkers, N + 1);
    false ->
      Queue
  end.
```

The function that handles inbound packets may delegate to a worker:

```erlang
{% verbatim %}
handle_request(Socket, Host, Port, Bin, State) ->
  case queue:out(State#state.workers) of
    {{value, Worker}, Queue} ->
      gen_server:cast(Worker, {udp_query, Socket, Host, Port, Bin}),
      {noreply, State#state{workers = queue:in(Worker, Queue)}};
    {empty, _Queue} ->
      % Drop the packet
      {noreply, State}
  end.
{% endverbatim %}
```
