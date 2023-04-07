defmodule TempleLiveviewWeb.TempleComponent do
  alias Phoenix.LiveView
  use TempleLiveviewWeb, :live_component
  import Temple
  import LiveView.TagEngine, only: [component: 3]

  def render(assigns) do
    temple do
      div do
        c(&TempleLiveviewWeb.HeexComponent.render/1)

        c(&TempleLiveviewWeb.HeexComponent.slot_render/1) do
          div do
            "This is a slot"
          end
        end
      end
    end
  end
end
