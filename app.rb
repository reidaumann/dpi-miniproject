require "sinatra"
require "sinatra/reloader"
require 'uri'
require 'net/http'
require 'net/https'
require 'json'

def make_abstract_request
  uri = URI('https://holidays.abstractapi.com/v1/?api_key=531d02b34ad341369573852129c5523c&country=US&year=2020&month=12&day=25')

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  request =  Net::HTTP::Get.new(uri)

  response = http.request(request)
  puts "Status code: #{ response.code }"
  puts "Response body: #{ response.body }"
  rescue StandardError => error
    puts "Error (#{ error.message })"

  pp response
end

get("/") do
  erb(:homepage)
end

get("/color-palette") do
  make_abstract_request

  erb(:palette_gen)
end
