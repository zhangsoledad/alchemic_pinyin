defimpl Pinyin, for: BitString do
  @doc ~S"""
  汉字转换成拼音
  ## Examples
      iex> Pinyin.from_string("龡龢龣龤龥癩")
      "chui he jue xie yu la"
      iex> Pinyin.from_string("龡龢龣龤龥癩", tone: true)
      "chùi hé júe xíe yù là"
      iex> Pinyin.from_string("龡龢龣龤龥癩", splitter: "-")
      "chui-he-jue-xie-yu-la"
      iex> Pinyin.from_string("龡龢龣龤龥癩", [], &String.first/1)
      "c"
  """
  @spec from_string(binary) :: binary
  defdelegate from_string(string), to: String.Pinyin, as: :to_pinyin

  @spec from_string(binary, Keyword.t()) :: binary
  defdelegate from_string(string, opts), to: String.Pinyin, as: :to_pinyin

  @spec from_string(binary, Keyword.t(), (binary -> any)) :: any
  defdelegate from_string(string, opts, fun), to: String.Pinyin, as: :to_pinyin
end
