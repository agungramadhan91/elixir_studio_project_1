defmodule QuoteGenerator.Quotes do
  @moduledoc """
  Menyediakan daftar kutipan dan pemilih acak.
  """

  @quotes [
    %{text: "Simplicity is the soul of efficiency.", author: "Austin Freeman"},
    %{text: "Programs must be written for people to read.", author: "Harold Abelson"},
    %{text: "Premature optimization is the root of all evil.", author: "Donald Knuth"},
    %{text: "Make it work, make it right, make it fast.", author: "Kent Beck"},
    %{text: "Talk is cheap. Show me the code.", author: "Linus Torvalds"}
  ]

  @doc "Ambil satu kutipan secara acak."
  def random do
    Enum.random(@quotes)
  end
end
