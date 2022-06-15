-module(counter_action_server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    counter_action_server_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
