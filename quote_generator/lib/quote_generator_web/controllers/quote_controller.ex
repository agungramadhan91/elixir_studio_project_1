defmodule QuoteGeneratorWeb.QuoteController do
  use QuoteGeneratorWeb, :controller
  alias QuoteGenerator.Quotes

  def index(conn, _params) do
    quote = Quotes.random()
    render(conn, :index, quote: quote)
  end
end
