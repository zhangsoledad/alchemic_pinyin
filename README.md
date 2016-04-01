# alchemic_pinyin

[![Build Status](https://travis-ci.org/zhangsoledad/alchemic_pinyin.svg?branch=master)](https://travis-ci.org/zhangsoledad/alchemic_pinyin.svg?branch=master)
[![Inline docs](http://inch-ci.org/github/zhangsoledad/alchemic_pinyin.svg?branch=master)](http://inch-ci.org/github/zhangsoledad/alchemic_pinyin)

中文汉字转拼音
>Inspired by [chinese_pinyin](https://github.com/flyerhzm/chinese_pinyin).

## Installation

1. Add pinyin to your list of dependencies in `mix.exs`:
```elixir
def deps do
  [{:alchemic_pinyin, "~> 0.1.0"}]
end
```

2. Ensure pinyin is started before your application:
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

## benchmark
```
mix bench
```
OS X

2.7 GHz Intel Core i5
8 GB 1867 MHz DDR3
```bash
Settings:
  duration:      1.0 s

BasicBench
  [14:01:23] 1/1: hello pinyin

Finished in 4.11 seconds

BasicBench
  hello pinyin      500000   6.73 µs/op
```
