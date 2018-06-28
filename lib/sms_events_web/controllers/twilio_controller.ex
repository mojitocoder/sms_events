defmodule SmsEventsWeb.TwilioController do
  use SmsEventsWeb, :controller

  def api_text(conn, _param) do
    text(conn, "Text endpoint")
  end

  def api_json(conn, _param) do
    json(conn, %{id: 1, name: "Quynh", job: "Developer"})
  end

  def sms_received(conn, param) do
    IO.inspect(param)
    # conn |> send_resp(204, "")
    json(conn |> put_status(:no_content), "")
  end
end
