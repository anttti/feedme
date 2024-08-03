defmodule FeedmeWeb.ReaderLive do
  use FeedmeWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <button phx-click="refresh_feeds">Sync feeds</button>
    </div>
    """
  end

  def handle_event("refresh_feeds", _value, socket) do
    Feedme.Reader.refresh_feeds()
    {:noreply, socket}
  end
end
