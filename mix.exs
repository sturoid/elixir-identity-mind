defmodule ExIdentityMind.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_identity_mind,
      version: "0.1.0",
      elixir: "~> 1.7",
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
      # JSON library.
      {:poison, "~> 4.0.1"},
      # HTTP client.
      {:httpoison, "~> 1.3.1"},
      # Generate html docs from comments.
      {:ex_doc, "~> 0.19.1"},
      # Mock api calls in tests.
      {:exvcr, "~> 0.10", only: :test}
    ]
  end
end
