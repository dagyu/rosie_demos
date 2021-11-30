-module(ros_clients_sup).

-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    SupFlags =
        #{strategy => simple_one_for_one,
          intensity => 0,
          period => 1},

    Cfg = [#{id => ros_client,
             start => {ros_client, start_link, []},
             restart => transient,
             shutdown => 5000,
             type => worker}],

    {ok, {SupFlags, Cfg}}.
