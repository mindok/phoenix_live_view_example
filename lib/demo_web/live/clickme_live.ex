defmodule DemoWeb.ClickMeLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <button phx-click="clicked">Click me</button>
      <p>I was clicked <%= @count %> times</p>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("clicked", _path, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end
end
