defmodule SmsEventsWeb.TwilioController do
  use SmsEventsWeb, :controller
  @topic "sms_received"

  def api_text(conn, _param) do
    text(conn, "Text endpoint")
  end

  def api_json(conn, _param) do
    json(conn, %{id: 1, name: "Quynh", job: "Developer"})
  end

  def sms_received(conn, param) do
    IO.inspect(param)
    publish(Poison.encode!(param), @topic)
    json(conn |> put_status(:no_content), "")
  end

  defp publish(message, topic) do
    KafkaEx.produce(%KafkaEx.Protocol.Produce.Request{
      topic: topic,
      partition: 0,
      required_acks: 1,
      messages: [%KafkaEx.Protocol.Produce.Message{value: message}]
    })
  end
end
