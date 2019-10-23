require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/property'
require_relative 'lib/user'
require_relative 'lib/request'


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
  @requests = Request.view_from_guestid(params[:id])
  @requests_to_confirm  = Request.view_from_ownerid(params[:id])
  @profile_owner = User.access_via_id(params[:id])
  erb :profile
end

get '/listings' do
  @currentuser=session[:currentuser]
  @currentuserID = @currentuser.id
  @properties = Property.view_all
  erb(:listings)
end

get '/book/:id' do
  @currentuser=session[:currentuser]
  session[:property_being_booked] = Property.access_via_id(params[:id])
  @property = session[:property_being_booked]
  erb :create_booking
end

post '/create_booking' do
  @property = session[:property_being_booked]
  @currentuserID = session[:currentuser].id
  date = params[:date]
  Request.add(guestID: @currentuserID, ownerID: @property.ownerID , propertyID: @property.id , date: date)
  redirect ('/listings')
end

get '/listings/new' do
  erb(:new_listing)
end

post '/listings' do
  @currentuserID = session[:currentuser].id
  property = Property.add(ownerID: @currentuserID, title: params[:title], address: params[:address], description: params[:description], picture: params[:pictureurl], ppn: params[:ppn].to_i, start_date: params[:start_date], end_date: params[:end_date] )
  if property == 'unique error'
    flash[:notice] = 'Property already exists'
    redirect('/listings/new')
  end
  redirect('/listings')
end

run! if app_file == $0
end
