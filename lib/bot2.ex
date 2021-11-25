
defmodule Fib do
    def fib(0) do 0 end
    def fib(1) do 1 end
    def fib(n) do fib(n-1) + fib(n-2) end
end

defmodule Bot2 do
  use Telegram.Bot,
    token: Application.get_env(:telegrambot, :token),
#    username: "chapter01bot",
    username: "FatherFrostBot",
    purge: true

    command "fib", args do
        {intVal, ""} = Integer.parse(Enum.at(args,0))
         request("sendMessage", chat_id: update["chat"]["id"],
         text: "Fib[#{intVal}] = #{Fib.fib(intVal)}")
    end

#  edited_message do
#    # handler code
#  end
#  channel_post do
#    # handler code
#  end
#  edited_channel_post do
#    # handler code
#  end
#  inline_query _query do
#    # handler code
#  end
#  chosen_inline_result _query do
#    # handler code
#  end
#  callback_query do
#    # handler code
#  end
#  shipping_query do
#    # handler code
#  end
#  pre_checkout_query do
#    # handler code
#  end

  def handle_update(
        token,
        data_raw = %{}
      ) do

      # data_raw
      # %{"channel_post" => %{"chat" => %{"id" => -1001728410621, "title" => "test", "type" => "channel", "username" => "ffatherfrost"}, "date" => 1637862242, "message_id" => 20, "sender_chat" => %{"id" => -1001728410621, "title" => "test", "type" => "channel", "username" => "ffatherfrost"}, "text" => "111"}, "update_id" => 521426571}

      message_id = data_raw["channel_post"]["message_id"]
      chat_id = data_raw["channel_post"]["chat"]["id"]
      text = data_raw["channel_post"]["text"]

      "/fib"<>val = text

      intval = val |> parse_seconds_arg()

    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      reply_to_message_id: message_id,
      text: "Fib[#{intval}] = #{Fib.fib(intval)}"
    )

  end

  defp parse_seconds_arg(arg) do
    default_arg = "1"
    arg = if arg == "", do: default_arg, else: arg
    {seconds, ""} = arg |> String.trim() |> Integer.parse()
    seconds
  end

    any do
       IO.puts "not found"
    end

end

# {:ok, _} = Bot2.start_link()
# Process.sleep(:infinity)
