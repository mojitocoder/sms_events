defmodule SmsEventsWeb.TwilioControllerTest do
  use SmsEventsWeb.ConnCase

  test "POST /twilio/sms_received", %{conn: conn} do
    conn = post(conn, "/twilio/sms_received")
    assert json_response(conn, 204) =~ ""
  end
end
