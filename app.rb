require "sinatra"
require "sinatra/reloader"
require 'uri'
require "http"
require 'net/http'
require 'json'

def get_random_quote_list
  api_url = "http://colormind.io/api/"
  data = HTTP.get(api_url)
  parsed_data = JSON.parse(data)
  
  return parsed_data

end

get("/") do
  erb(:homepage)
end

get("/color-palette") do
  @color_palette = get_random_quote_list
  erb(:palette_gen)
end
