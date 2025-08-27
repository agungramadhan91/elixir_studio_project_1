defmodule QuoteGeneratorWeb.QuoteControllerTest do
  use QuoteGeneratorWeb.ConnCase, async: true

  test "GET / shows a quote", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Quote Generator"
    assert conn.resp_body =~ "“"
  end
end
