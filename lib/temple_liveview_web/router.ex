defmodule TempleLiveviewWeb.Router do
  use TempleLiveviewWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TempleLiveviewWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TempleLiveviewWeb do
    pipe_through :browser

    get "/", PageController, :home
    live "/temple", TempleLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", TempleLiveviewWeb do
  #   pipe_through :api
  # end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:temple_liveview, :dev_routes) do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
