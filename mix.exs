defmodule DownloadEx.Mixfile do
  use Mix.Project

  def project do
    [app: :ninetynine,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     test_coverage: [tool: ExCoveralls]]
  end


  def application do
    [applications: []]
  end


  defp deps do
    [
      {:mr_t, "~> 0.5.0", only: [:test, :dev]},
      {:excoveralls, "~> 0.3", only: [:dev, :test]}
    ]
  end
end
