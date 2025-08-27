defmodule QuoteGenerator.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      QuoteGeneratorWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:quote_generator, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: QuoteGenerator.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: QuoteGenerator.Finch},
      # Start a worker by calling: QuoteGenerator.Worker.start_link(arg)
      # {QuoteGenerator.Worker, arg},
      # Start to serve requests, typically the last entry
      QuoteGeneratorWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: QuoteGenerator.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    QuoteGeneratorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
