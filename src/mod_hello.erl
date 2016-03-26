-module(mod_hello).

-behaviour(gen_mod).

%% Required by ?INFO_MSG macros
-include("logger.hrl").
-include("ejabberd.hrl").
-include("jlib.hrl").



%% gen_mod API callbacks
%% gen_mod API callbacks
%% gen_mod API callbacks
 
-export([start/2, stop/1, on_filter_packet/1]).

start(_Host, _Opts) ->
    ?INFO_MSG("mod_hello START! ~p : ~p", [_Host, _Opts]),
        ejabberd_hooks:add(filter_packet, global , ?MODULE, on_filter_packet, 100),
    ok.

stop(_Host) ->
	
    ?INFO_MSG("mod_hello STOP!!", []),
	ejabberd_hooks:delete(filter_packet, global, ?MODULE, on_filter_packet, 100),	
    ok.


on_filter_packet({From, To, XML} = Packet) ->
    %% does something with a packet
    %% should return modified Packet or atom `drop` to drop the packet
    
    FromUser 	=  From#jid.luser,
    FromServer 	=  From#jid.lserver,
        
    
    ?INFO_MSG("Packet HERE!!  from: ~s@~s"  , [FromUser , FromServer ]),
    Packet.
    


