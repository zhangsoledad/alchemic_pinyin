require 'benchmark'
require 'allocation_tracer'
require 'chinese_pinyin'

n = 500000
Benchmark.bmbm(7) do |x|
  x.report("pinyin") { n.times {Pinyin.t("99da龡龢da龣龤龥癩s什么鬼东西hah")} }
end

