
defmodule Bot1 do
  use Telegram.Bot,
    token: Application.get_env(:telegrambot, :token),
#    username: "chapter01bot",
    username: "FatherFrostBot",
    purge: true

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

end

# {:ok, _} = Bot1.start_link()
# Process.sleep(:infinity)


