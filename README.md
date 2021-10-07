# alchemic_pinyin

[![Build Status](https://travis-ci.org/zhangsoledad/alchemic_pinyin.svg?branch=master)](https://travis-ci.org/zhangsoledad/alchemic_pinyin.svg?branch=master)
[![Module Version](https://img.shields.io/hexpm/v/alchemic_pinyin.svg)](https://hex.pm/packages/alchemic_pinyin)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/alchemic_pinyin/)
[![Total Download](https://img.shields.io/hexpm/dt/alchemic_pinyin.svg)](https://hex.pm/packages/alchemic_pinyin)
[![License](https://img.shields.io/hexpm/l/alchemic_pinyin.svg)](https://github.com/zhangsoledad/alchemic_pinyin/blob/master/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/zhangsoledad/alchemic_pinyin.svg)](https://github.com/zhangsoledad/alchemic_pinyin/commits/master)

Conversion of Chinese Word to Pinyin.（中文汉字转拼音）

>Inspired by [chinese_pinyin](https://github.com/flyerhzm/chinese_pinyin).

## Installation

Add `:pinyin` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:alchemic_pinyin, "~> 0.1.0"}
  ]
end
```

Ensure `:pinyin` is started before your application if you're running Elixir < 1.4:

```elixir
def application do
  [applications: [:alchemic_pinyin]]
end
```

## Usage
```bash
iex> Pinyin.from_string("龡龢龣龤龥癩")
"chui he jue xie yu la"

iex> Pinyin.from_string("龡龢龣龤龥癩", tone: true)
"chùi hé júe xíe yù là"

iex> Pinyin.from_string("龡龢龣龤龥癩", splitter: "-")
"chui-he-jue-xie-yu-la"

iex> Pinyin.from_string("龡龢龣龤龥癩", [], &String.first/1)
"c"
```

## Benchmark

macOS X, 2.7 GHz Intel Core i5, 8 GB 1867 MHz DDR3.

```bash
$ mix bench

Settings:
  duration:      1.0 s

BasicBench
  [14:01:23] 1/1: hello pinyin

Finished in 4.11 seconds

BasicBench
  hello pinyin      500000   6.73 µs/op
```

## Copyright and License

Copyright (c) 2016 zhangsoledad

This work is free. You can redistribute it and/or modify it under the
terms of the MIT License. See the [LICENSE.md](./LICENSE.md) file for more details.
