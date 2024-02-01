require "sinatra"
require "sinatra/reloader"
require 'uri'
require "http"
require 'net/http'
require 'json'

def get_random_quote_list
  api_url = "https://api.quotable.io/quotes/random?limit=5"
  data = HTTP.get(api_url)
  parsed_data = JSON.parse(data)
  
  return parsed_data

end

get("/") do
  erb(:homepage)
end

get("/color-palette") do
  @quote_list = get_random_quote_list
  erb(:palette_gen)
end
