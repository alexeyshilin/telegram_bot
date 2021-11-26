
defmodule Bot1 do
  use Telegram.Bot,
    token: Application.get_env(:telegrambot, :token),
#    username: "chapter01bot",
    username: "FatherFrostBot",
    purge: true

    # receive message by bot directly
  message do
    request(
      "sendMessage",
      chat_id: update["chat"]["id"],
      text: "Hey! You sent me a message: #{inspect(update)}"
    )
  end

  def handle_update(
        %{"message" => %{"text" => msg, "chat" => %{"id" => chat_id}, "message_id" => message_id}},
        token
      ) do

    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      reply_to_message_id: message_id,
      text: "Hey! You sent me a message: #{msg}"
    )

  end

  def handle_update(
        token,
        data_raw = %{}
      ) do

      # data_raw
      # %{"channel_post" => %{"chat" => %{"id" => -1001728410621, "title" => "test", "type" => "channel", "username" => "ffatherfrost"}, "date" => 1637862242, "message_id" => 20, "sender_chat" => %{"id" => -1001728410621, "title" => "test", "type" => "channel", "username" => "ffatherfrost"}, "text" => "111"}, "update_id" => 521426571}

      message_id = data_raw["channel_post"]["message_id"]
      chat_id = data_raw["channel_post"]["chat"]["id"]
      text = data_raw["channel_post"]["text"]

    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
#      reply_to_message_id: message_id,
      text: "Hey! You sent me a some message: #{text}"
    )

  end

end

# {:ok, _} = Bot1.start_link()
# Process.sleep(:infinity)


