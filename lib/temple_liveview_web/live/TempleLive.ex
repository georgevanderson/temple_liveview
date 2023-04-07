defmodule TempleLiveviewWeb.TempleLive do
  use TempleLiveviewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.live_component module={TempleLiveviewWeb.TempleComponent} id="component" />
    """
  end
end
