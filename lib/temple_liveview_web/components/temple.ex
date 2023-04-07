defmodule TempleLiveviewWeb.TempleComponent do
  use TempleLiveviewWeb, :html

  import Phoenix.LiveView.TagEngine, only: [component: 3, inner_block: 2]

  def render(assigns) do
    temple do
      div do
        c &TempleLiveviewWeb.HeexComponent.render/1

        c &TempleLiveviewWeb.HeexComponent.slot_render/1 do
          div do
            "This is a slot"
          end
        end
      end
    end
  end
end
