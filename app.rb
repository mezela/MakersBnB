require 'sinatra/base'
require_relative 'lib/property'
require_relative 'lib/user'

class Makersbnb<Sinatra::Base
enable :sessions

get '/' do
'Hello'
end

get '/account/new' do

end

get '/account' do

end

get '/listings' do
  @properties = Property.view_all
  erb(:listings)
end

run! if app_file == $0
end
