require "sinatra"
require "sinatra/reloader"
require 'uri'
require 'net/http'
require 'json'

get("/") do
  erb(:homepage)
end

get("/color-palette") do
  url = URI("https://andruxnet-random-famous-quotes.p.rapidapi.com/?cat=movies&count=10")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  
  request = Net::HTTP::Post.new(url)
  request["X-RapidAPI-Key"] = '39f0b3a00dmsh6ec3586d033e418p1e6320jsn5b6729d40c32'
  request["X-RapidAPI-Host"] = 'andruxnet-random-famous-quotes.p.rapidapi.com'
  
  response = http.request(request)
  puts response.read_body
  erb(:palette_gen)
end
