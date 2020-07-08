#!/usr/bin/env ruby

require "sinatra"

HEADERS = { "Content-Type" => "text/plain" }

get "/:status" do
  sleep params["sleep"].to_i
  halt params["status"].to_i, HEADERS, body_content
end

def body_content
  [params["status"], status_description].compact.join(" ")
end

def status_description
  Rack::Utils::HTTP_STATUS_CODES[params["status"].to_i]
end
