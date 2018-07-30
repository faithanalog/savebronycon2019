require 'sinatra'
require 'redis'
require 'json'

redis = Redis.new(url: ENV["REDISTOGO_URL"])

PONIES_SAVING_BRONYCON = "ponies_saving_bronycon"

set :public_folder, File.dirname(__FILE__) + '/static'
set :static, true
#set :static_cache_control, ???

get '/' do
  redirect '/index.html'
end

get '/api/how_many_saving_bronycon' do
  n = redis.get(PONIES_SAVING_BRONYCON).to_i
  JSON.generate({
    "ponies_saving_bronycon" => n
  })
end

post '/api/save_bronycon' do
  redis.incr PONIES_SAVING_BRONYCON
  "You Helped Save BronyCon!"
end
