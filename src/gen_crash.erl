-module(gen_crash).
-behaviour(gen_server).

-export([add/1]).

-export([
         init/1,
         handle_cast/2,
         handle_call/3,
         start_link/1
]).

start_link(N) ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, N, []).

init(N) ->
  R = {ok, N, N},
  R.

add(N) ->
  gen_server:call(?MODULE, {add, N}, 20000).

handle_cast(_Cast, State) ->
  {noreply, State}.

handle_call({add, N}, _, State) ->
  R = N + State,
  {reply, R, State}.

