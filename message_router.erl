-module (message_router).

-compile(export_all).

route_messages() ->
  receive
    {send_chat_msg, Addressee, MessageBody} ->
      Addressee ! {recv_chat_msg, MessageBody};
    {recv_chat_msg, MessageBody} ->
      io:format("Received: ~p~n", [MessageBody]);
    Oops ->
      io:format("Warning! Received: ~p~n", [Oops])
  end,
  route_messages().