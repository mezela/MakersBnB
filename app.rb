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

run! if app_file == $0
end
