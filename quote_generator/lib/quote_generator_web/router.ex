defmodule QuoteGeneratorWeb.Router do
  use QuoteGeneratorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {QuoteGeneratorWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    # opsional agar browser tak cache halaman (biar benar2 acak tiap reload)
    plug :put_no_cache
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QuoteGeneratorWeb do
    pipe_through :browser

    get "/welcome", PageController, :home
    get "/", QuoteController, :index
  end

  # --- helper plug (opsional) ---
  import Plug.Conn
  defp put_no_cache(conn, _opts) do
    conn
    |> put_resp_header("cache-control", "no-store, no-cache, must-revalidate, max-age=0")
    |> put_resp_header("pragma", "no-cache")
  end

  # Other scopes may use custom stacks.
  # scope "/api", QuoteGeneratorWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:quote_generator, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: QuoteGeneratorWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
