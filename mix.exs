defmodule Telegrambot.MixProject do
  use Mix.Project

  def project do
    [
      app: :telegrambot, # the name of the file to load from the lib folder
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}

      {:timex, "~> 3.0"},
      {:telegram, git: "https://github.com/visciang/telegram.git", tag: "0.5.0"}

    ]
  end
end
