#!/usr/bin/env ruby

require "sinatra"
require "sinatra/multi_route"

HEADERS = { "Content-Type" => "text/plain" }

get "/:status", "/:status/:sleep" do
  sleep params["sleep"].to_i
  halt params["status"].to_i, HEADERS, body_content
end

def body_content
  [params["status"], status_description].compact.join(" ")
end

def status_description
  Rack::Utils::HTTP_STATUS_CODES[params["status"].to_i]
end
