require "sinatra"
require "sinatra/reloader"
require "json"
require "http"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "

  erb(:homepage)
end

get("/color-palette") do

  erb(:palette_gen)
end
