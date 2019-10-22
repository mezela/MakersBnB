require 'sinatra/base'
require_relative 'lib/property'
require_relative 'lib/user'

class Makersbnb<Sinatra::Base
enable :sessions

get '/' do
erb :index
end

get '/signup' do
erb :signup
end

post '/account_creation' do
User.create(username: params[:username], email: params[:email], password: params[:password])
p params
redirect '/'
end

run! if app_file == $0
end
