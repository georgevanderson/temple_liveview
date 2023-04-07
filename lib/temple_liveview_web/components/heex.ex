defmodule TempleLiveviewWeb.HeexComponent do
  use TempleLiveviewWeb, :html


  def render(assigns) do
    ~H"""
    <div>
      This component works!
    </div>
    """
  end

  def slot_render(assigns) do
    ~H"""
    <div>
      <%= render_slot(@inner_block, %{}) %>
    </div>
    """
  end
end
