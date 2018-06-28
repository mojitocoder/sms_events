defmodule SmsEventsWeb.TwilioControllerTest do
  use SmsEventsWeb.ConnCase

  test "POST /twilio/sms_received successfully", %{conn: conn} do
    conn =
      post(conn, "/twilio/sms_received", %{
        "AccountSid" => "AC5b2ee1a418f0769988eda13f530cec13",
        "AddOns" => "{\"status\":\"successful\",\"message\":null,\"code\":null,\"results\":{}}",
        "ApiVersion" => "2010-04-01",
        "Body" => "Aloha",
        "From" => "+447541440207",
        "FromCity" => "",
        "FromCountry" => "GB",
        "FromState" => "",
        "FromZip" => "",
        "MessageSid" => "SM5bd91b5f10f0b149bdf271c27b94a7f6",
        "NumMedia" => "0",
        "NumSegments" => "1",
        "SmsMessageSid" => "SM5bd91b5f10f0b149bdf271c27b94a7f6",
        "SmsSid" => "SM5bd91b5f10f0b149bdf271c27b94a7f6",
        "SmsStatus" => "received",
        "To" => "+441202835282",
        "ToCity" => "",
        "ToCountry" => "GB",
        "ToState" => "Bournemouth",
        "ToZip" => ""
      })

    assert json_response(conn, 204) =~ ""
  end

  test "Text endpoint responds correctly", %{conn: conn} do
    conn = get(conn, "/twilio/text")

    assert conn.status == 200
    assert conn.resp_body == "Text endpoint"

    # assert html_response(conn, 200) == "Text endpoint"
    assert text_response(conn, 200) == "Text endpoint"

    assert response(conn, 200) == "Text endpoint"
  end
end
