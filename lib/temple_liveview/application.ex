defmodule TempleLiveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TempleLiveviewWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TempleLiveview.PubSub},
      # Start Finch
      {Finch, name: TempleLiveview.Finch},
      # Start the Endpoint (http/https)
      TempleLiveviewWeb.Endpoint
      # Start a worker by calling: TempleLiveview.Worker.start_link(arg)
      # {TempleLiveview.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TempleLiveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TempleLiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
