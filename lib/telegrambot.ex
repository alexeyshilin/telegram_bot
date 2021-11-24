defmodule Telegrambot do
  @moduledoc """
  Documentation for `Telegrambot`.
  """

  use Timex

  @doc """
  Hello world.

  ## Examples

      iex> Telegrambot.hello()
      :world

  """
  def hello do
    :world
  end

  def timexnow do
    IO.puts Timex.now
  end

end
