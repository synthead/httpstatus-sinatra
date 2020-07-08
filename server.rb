#!/usr/bin/env ruby

require "sinatra"

HEADERS = { 'Content-Type' => 'text/plain' }

get "/:status" do
  sleep params["sleep"].to_i
  halt params["status"].to_i, HEADERS, body_content(status)
end

def body_content(status)
  status_description = Rack::Utils::HTTP_STATUS_CODES[params["status"].to_i]
  [params["status"], status_description].compact.join(" ")
end
