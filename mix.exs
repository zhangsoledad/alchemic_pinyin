defmodule Pinyin.Mixfile do
  use Mix.Project

  def project do
    [app: :alchemic_pinyin,
     version: "0.1.1",
     elixir: "~> 1.2",
     description: description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps,
     docs: [extras: ["README.md"] ]
     ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: []]
  end

  defp deps do
    [{:benchfella, "~> 0.3.0", only: :dev},
    {:earmark, "~> 0.1", only: :dev},
    {:ex_doc, "~> 0.11", only: :dev},
    {:dialyze, "~> 0.2.0", only: :dev},
    {:inch_ex, "~> 0.5", only: :docs}]
  end

  defp description do
    """
    中文汉字转拼音.
    """
  end

  defp package do
    [maintainers: ["zhangsoledad"],
     licenses: ["MIT"],
     links: %{"Github" => "https://github.com/zhangsoledad/alchemic_pinyin"},
     files: ~w(mix.exs README.md lib)]
  end
end
