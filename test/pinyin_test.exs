defmodule PinyinTest do
  use ExUnit.Case, async: true
  doctest Pinyin

  @pure_hanzi "龡龢龣龤龥癩什么鬼东西"
  @hanzi_eng "a龡dsa龢dsa龣龤das龥癩dasdas什么das鬼东西dad"

  test "default opts" do
    assert Pinyin.from_string(@pure_hanzi)  == "chui he jue xie yu la shi yao gui dong xi"
    assert Pinyin.from_string(@hanzi_eng)  == "a chui dsa he dsa jue xie das yu la dasdas shi yao das gui dong xi dad"
  end

  test "tone true" do
    assert Pinyin.from_string(@pure_hanzi, tone: true)  == "chùi hé júe xíe yù là shí yāo gǔi dōng xī"
    assert Pinyin.from_string(@hanzi_eng, tone: true)  == "a chùi dsa hé dsa júe xíe das yù là dasdas shí yāo das gǔi dōng xī dad"
  end

  test "splitter" do
    assert Pinyin.from_string(@pure_hanzi, splitter: "-")  == "chui-he-jue-xie-yu-la-shi-yao-gui-dong-xi"
    assert Pinyin.from_string(@hanzi_eng, splitter: "-")  == "a-chui-dsa-he-dsa-jue-xie-das-yu-la-dasdas-shi-yao-das-gui-dong-xi-dad"
  end

  test "arity 3 fun" do
    assert Pinyin.from_string(@pure_hanzi, [], & String.first(&1))  == "c"
    assert Pinyin.from_string(@hanzi_eng, [], & String.first(&1))  == "a"
  end
end
