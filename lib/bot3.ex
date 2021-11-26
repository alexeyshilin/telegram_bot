
defmodule Bot3 do
  use Telegram.Bot,
    token: Application.get_env(:telegrambot, :token),
#    username: "chapter01bot",
    username: "FatherFrostBot",
#	auth: ["user1", "user2"],
#	auth: [],
	purge: true


    command ["ciao", "hello"], args do
      # handle the commands: "/ciao" and "/hello"

      # reply with a text message
      request("sendMessage",
        chat_id: update["chat"]["id"],
        text: "ciao! #{inspect args}")
    end

    command unknown do
      request("sendMessage", chat_id: update["chat"]["id"],
        text: "Unknow command `#{unknown}`")
    end

    # receive message by bot directly
    message do
      request("sendMessage", chat_id: update["chat"]["id"],
        text: "Hey! You sent me a message: #{inspect update}")
    end

    edited_message do
      # handler code
    end
      
    channel_post do
      # handler code
    end

    edited_channel_post do
      # handler code
    end

    inline_query _query do
      # handler code
    end

    chosen_inline_result _query do
      # handler code
    end

    callback_query do
      # handler code
    end

    shipping_query do
      # handler code
    end

    pre_checkout_query do
      # handler code
    end

    any do
      # handler code
    end

end

# {:ok, _} = Bot3.start_link()
# Process.sleep(:infinity)
