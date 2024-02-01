require "sinatra"
require "sinatra/reloader"
require 'uri'
require 'net/http'
require 'json'

get("/") do
  erb(:homepage)
end

get("/color-palette") do
  url = URI("https://ai-color-generator.p.rapidapi.com/generate-color")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Post.new(url)
  request["content-type"] = 'application/json'
  request["X-RapidAPI-Key"] = '39f0b3a00dmsh6ec3586d033e418p1e6320jsn5b6729d40c32'
  request["X-RapidAPI-Host"] = 'ai-color-generator.p.rapidapi.com'
  request.body = "{\r\n    \"colorList\": [\r\n        \"#FBE18F\",\r\n        \"#1F271B\"\r\n    ]\r\n}"

  response = http.request(request)
  puts response.read_body
  erb(:palette_gen)
end
