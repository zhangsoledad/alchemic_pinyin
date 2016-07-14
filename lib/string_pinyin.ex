defmodule String.Pinyin do
  @moduledoc ~S"""
  A Pinyin Libary.
  """
  @external_resource data_path = Path.join(__DIR__, "data/pinyin.dat")

  file_stream = File.stream!(data_path) |> Stream.with_index

  pinyin_codes = Enum.reduce(file_stream, [], fn({line, index}, acc) ->
    [han, pinyin, tone, pinyin_with_tone ]  = line
    |> String.rstrip(?\n)
    |> :binary.split(";", [:global])
    [ { han, pinyin, tone, pinyin_with_tone , index} | acc ]
  end) |> Enum.reverse

  line_count = length(pinyin_codes)

  def to_pinyin(string) do
    to_pinyin(string, [])
  end

  def to_pinyin(string, opts) do
    splitter = Keyword.get(opts, :splitter, " ")
    tone = Keyword.get(opts, :tone, false)
    if tone do
      do_to_pinyin_tone(string, "", splitter)
    else
      do_to_pinyin(string, "", splitter)
    end
  end

  def to_pinyin(string, opts, fun) when is_function(fun) do
    fun.(to_pinyin(string, opts))
  end

  #do_to_pinyin
  for {han, pinyin, _tone, pinyin_with_tone, index} <- pinyin_codes do
    ProgressBar.render(index , line_count)
    defp do_to_pinyin(unquote(han) <> rest, acc, splitter) do
      do_to_pinyin(rest, do_acc(acc, splitter, unquote(pinyin), rest), splitter)
    end

    defp do_to_pinyin_tone(unquote(han) <> rest, acc, splitter) do
      do_to_pinyin_tone(rest, do_acc(acc, splitter, unquote(pinyin_with_tone), rest), splitter)
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

  defp do_to_pinyin_tone(<<char, rest::binary>>, acc, splitter) do
    case rest |> String.first |> add_splitter? do
      false ->
        do_to_pinyin_tone(rest, <<acc::binary, char>>, splitter)
      true ->
        char_splitter = <<char, splitter::binary>>
        do_to_pinyin_tone(rest, <<acc::binary, char_splitter::binary>>, splitter)
    end
  end

  defp do_to_pinyin_tone("", acc, _splitter), do: acc
  #do_to_pinyin

  defp do_acc(acc, _splitter, pinyin, "") do
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

  defp add_splitter?(_) do
    false
  end
end
