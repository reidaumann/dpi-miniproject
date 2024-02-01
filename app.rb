require "sinatra"
require "sinatra/reloader"
require "json"
require "http"

def get_color_palette
  api_url = "http://colormind.io/api/"

  data = HTTP.get(api_url)
  parsed_data = JSON.parse(data)
  
  return parsed_data

end

get("/") do
  erb(:homepage)
end

get("/color-palette") do
  @new_palette=get_color_palette
  erb(:palette_gen)
end
