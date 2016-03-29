defmodule BasicBench do
  use Benchfella

  @test_string "99da龡龢da龣龤龥癩s什么鬼东西hah"

  bench "hello pinyin" do
    Pinyin.from_string @test_string
  end
end
