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
        ejabberd_hooks:add(filter_packet, global, ?MODULE, on_filter_packet, 0),
    ok.

stop(_Host) ->
	%% ejabberd_hooks:delete(filter_packet, global, ?MODULE, filter_packet, 100),
    ?INFO_MSG("Bye bye, ejabberd world!", []),
     ejabberd_hooks:delete(filter_packet, global, ?MODULE, on_filter_packet, 0),
    ok.


on_filter_packet({From, To, XML} = Packet) ->
    %% does something with a packet
    %% should return modified Packet or atom `drop` to drop the packet
    ?INFO_MSG("From: ~p    To: ~p", [From, To]),
Packet.


