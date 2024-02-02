require "sinatra"
require "sinatra/reloader"
require 'uri'
require 'net/http'
require 'net/https'
require 'json'

def make_abstract_request
  require 'net/http'
  require 'json'
  
  api_key = '531d02b34ad341369573852129c5523c'
  country = 'US'
  year = 2020
  month = rand(1..12)
  day = rand(1..30)
  
  url = URI("https://holidays.abstractapi.com/v1/?api_key=#{api_key}&country=#{country}&year=#{year}&month=#{month}&day=#{day}")
  
  response = Net::HTTP.get(url)
  data = JSON.parse(response)
  
  data_hash=data.first
  @holiday_name=data_hash.fetch("name")
  @holiday_descrip=data_hash.fetch("description")
  @holiday_day=data_hash.fetch("date_day")
  @holiday_month=data_hash.fetch("date_month")
end

get("/") do
  erb(:homepage)
end

get("/color-palette") do
  make_abstract_request()
  erb(:palette_gen)
end
