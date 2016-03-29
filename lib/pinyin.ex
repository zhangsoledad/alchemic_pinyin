defmodule String.Pinyin do
  data_path = Path.join(__DIR__, "data/pinyin.dat")

  pinyin_codes = Enum.reduce File.stream!(data_path), [], fn(line, acc) ->
    [han, pinyin, tone, pinyin_with_tone ]  = line
    |> String.rstrip(?\n)
    |> :binary.split(";", [:global])
    [{han, pinyin, tone, pinyin_with_tone } | acc]
  end


  def to_pinyin(string) do
    to_pinyin(string, splitter: " ")
  end

  def to_pinyin(string, opts) do
    splitter = Keyword.get(opts, :splitter, " ")
    do_to_pinyin(string, "", splitter)
  end

  def to_pinyin(string, opts, fun) when is_function(fun) do
    splitter = Keyword.get(opts, :splitter, " ")
    fun.(do_to_pinyin(string, "", splitter))
  end

  for {han, pinyin, tone, pinyin_with_tone} <- pinyin_codes do
    defp do_to_pinyin(unquote(han) <> rest, acc, splitter) do
      do_to_pinyin(rest, do_acc(acc, splitter, unquote(pinyin), rest), splitter)
    end
  end

  defp do_to_pinyin(<<char, rest::binary>>, acc, splitter) do
    case rest |> String.first |> add_splitter? do
      false ->
        do_to_pinyin(rest, <<acc::binary, char>>, splitter)
      true ->
        char_splitter = <<char, splitter::binary>>
        do_to_pinyin(rest, <<acc::binary, char_splitter::binary>>, splitter)
    end
  end

  defp do_to_pinyin("", acc, _splitter), do: acc

  defp do_acc(acc, splitter, pinyin, "") do
    acc <> pinyin
  end

  defp do_acc(acc, splitter, pinyin, _rest) do
    acc <> pinyin <> splitter
  end

  defp add_splitter?(nil) do
    false
  end

  defp add_splitter?(<<char::utf8>>) do
    !(( char >= 97 and char <= 122 ) or # a-z
    ( char >= 65 and char <= 90 ) or # A-Z
    ( char >= 48 and char <= 57 )) # 0-9
  end
end
