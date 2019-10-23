require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/property'
require_relative 'lib/user'

class Makersbnb<Sinatra::Base
register Sinatra::Flash
enable :sessions, :method_override

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

post '/login' do
  p params
  session[:currentuser] = User.access_account(params[:username],params[:password])
  if (session[:currentuser] == "invalid login error")
    flash[:warning] = 'Incorrect login details'
    redirect '/'
  else
    redirect '/listings'
  end
end

post '/account_creation' do
  user = User.create(username: params[:username], email: params[:email], password: params[:password])
  case user
  when 'password_length_error'
    flash[:warning] = "Password too short"
    redirect '/signup'
  when 'password_safety_error'
    flash[:warning] = "Password must contain a number"
    redirect '/signup'
  when 'unique error'
    flash[:warning] = "username or email taken"
    redirect '/signup'
  else
    redirect '/'
  end
end

get'/profile/:id' do
  @profile_owner = User.access_via_id(params[:id])
  erb :profile
end

get '/listings' do
  @currentuser=session[:currentuser]
  @properties = Property.view_all
  erb(:listings)
end

run! if app_file == $0
end
