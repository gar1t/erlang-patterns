-module(flow_control).
-export([report_result/1, report_result_via_case/1]).
-include_lib("eunit/include/eunit.hrl").

% An example with case
report_result_via_case(Response) -> 
  case Response of
    {ok,    Msg} -> report_success(Msg);
    {error, Msg} -> report_failure(Msg)
  end.

% An example with pattern matching
report_result({ok,    Msg}) -> report_success(Msg);
report_result({error, Msg}) -> report_failure(Msg).

% private/hidden functions
% Real code would do something meaningful with the argument.
report_success(_Msg) -> success.
report_failure(_Msg) -> failure.

%% TESTS
success_via_case_test() -> ?assertEqual(success, report_result_via_case({ok,    anything})).
failure_via_case_test() -> ?assertEqual(failure, report_result_via_case({error, anything})).

success_via_pm_test() -> ?assertEqual(success, report_result({ok,    anything})).
failure_via_pm_test() -> ?assertEqual(failure, report_result({error, anything})).
