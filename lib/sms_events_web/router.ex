defmodule SmsEventsWeb.Router do
  use SmsEventsWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", SmsEventsWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/twilio", SmsEventsWeb do
    pipe_through(:api)

    get("/", TwilioController, :api_text)

    get("/text", TwilioController, :api_text)

    get("/json", TwilioController, :api_json)
  end
end
