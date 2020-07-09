#!/usr/bin/env ruby

require "sinatra"

HEADERS = { "Content-Type" => "text/plain" }

get %r{/(?<status_and_sleep>\d+(-\d+)?)(/.*)?} do
  status_and_sleep = params["status_and_sleep"].split("-")
  status_code, sleep_seconds = (0..1).map { |i| status_and_sleep[i].to_i }

  body_content = [status_code, Rack::Utils::HTTP_STATUS_CODES[status_code]].compact.join(" ")

  sleep(sleep_seconds)
  halt(status_code, HEADERS, body_content)
end
