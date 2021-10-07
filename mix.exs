defmodule Pinyin.Mixfile do
  use Mix.Project

  @source_url "https://github.com/zhangsoledad/alchemic_pinyin"
  @version "0.1.2"

  def project do
    [
      app: :alchemic_pinyin,
      version: @version,
      elixir: "~> 1.2",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [
      {:benchfella, "~> 0.3.0", only: :dev},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:dialyze, "~> 0.2.0", only: :dev},
      {:progress_bar, "> 0.0.0"}
    ]
  end

  defp package do
    [
      description: "Conversion of Chinese Word to Pinyin. （中文汉字转拼音）",
      maintainers: ["zhangsoledad"],
      licenses: ["MIT"],
      files: ~w(mix.exs README.md lib),
      links: %{
        "GitHub" => @source_url
      }
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end
end
