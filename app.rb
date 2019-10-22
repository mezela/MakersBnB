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

get '/listings' do
  @currentuserID = 35
  @properties = Property.view_all
  erb(:listings)
end

get '/listings/new' do
  erb(:new_listing)
end

post '/listings' do
  # @prop = Property.format_date(start_date: params[:start_date], end_date: params[:end_date] )
  # @start_date = params[:start_date].split('/').reverse.join('-')
  # @end_date = params[:end_date].split('/').reverse.join('-')
  @currentuserID = 35
  property = Property.add(ownerID: @currentuserID, title: params[:title], address: params[:address], description: params[:description], picture: params[:pictureurl], ppn: params[:ppn].to_i, start_date: params[:start_date], end_date: params[:end_date] )
  if property == 'unique error'
    flash[:notice] = 'Property already exists'
    redirect('/listings/new')
  end
  redirect('/listings')
end

run! if app_file == $0
end
