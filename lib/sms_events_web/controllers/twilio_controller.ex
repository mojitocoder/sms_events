defmodule SmsEventsWeb.TwilioController do
  use SmsEventsWeb, :controller

  def api_text(conn, _param) do
    text(conn, "Text endpoint")
  end

  def api_json(conn, _param) do
    json(conn, %{id: 1, name: "Quynh", job: "Developer"})
  end
end
