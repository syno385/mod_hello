-module(mod_hello).

-behaviour(gen_mod).

%% Required by ?INFO_MSG macros
-include("logger.hrl").
-include("ejabberd.hrl").
-include("jlib.hrl").



%% gen_mod API callbacks
%% gen_mod API callbacks
%% gen_mod API callbacks
 
-export([start/2, stop/1]).

start(_Host, _Opts) ->
    ?INFO_MSG("Hello, ejabberd world! ~p", [_Opts]),
     %~ ejabberd_hooks:add(filter_packet, global, ?MODULE, filter_packet, 100),
    ok.

stop(_Host) ->
	%% ejabberd_hooks:delete(filter_packet, global, ?MODULE, filter_packet, 100),
    ?INFO_MSG("Bye bye, ejabberd world!", []),
    ok.


%~ filter_packet({From, To, Packet} = Input) ->
%~ ?INFO_MSG("Hello, ejabberd world!", []),
%~ ok.


