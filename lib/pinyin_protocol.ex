defprotocol Pinyin do
  def from_string(string)
  def from_string(string, opts)
  def from_string(string, opts, fun)
end
