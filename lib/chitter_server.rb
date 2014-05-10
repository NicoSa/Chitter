require 'sinatra'
require 'sinatra/base'
require 'rack-flash'
require_relative './user.rb'
require_relative './email_controller.rb'
require_relative './post.rb'
require_relative './data_mapper_setup.rb'
require_relative '../helpers/current_user.rb'

include Email
include BCrypt

use Rack::Flash

enable :sessions
set :session_secret, 'super secret'

get '/' do
  @posts = Post.all
  erb :index
end

post '/' do
  post_time = Time.now
  post_time = post_time.strftime("%H:%M")
  Post.create(:message => params[:message], :time => post_time)
  redirect to('/user_interface')
end

get '/signup/new' do
    @user = User.new
    erb :new_user
end

post '/signup' do
  "#{params[:email]}, #{params[:name]}, #{params[:nickname]}, #{params[:password]}, #{params[:password_confirmation]}"
  begin
    @user = User.create(:email => params[:email],
                        :name => params[:name],
                        :nickname => params[:nickname],
                        :password => params[:password],
                        :password_confirmation => params[:password_confirmation])
  
     @user.save
    session[:user_id] = @user.id
    "successful signup"
    # redirect to ('/user_interface')
  rescue
    "lol crash"
  end
end



post '/login' do
  email, password = params[:email], params[:password]
  @user = User.authenticate(email, password)
  if @user
    session[:user_id] = @user.id
    redirect to('/user_interface')
  else
    flash[:errors] = ["The email or password is incorrect"]
    erb :"sessions/new"
  end
end

get '/user_interface' do
  erb :user_interface
end

delete '/logout' do
  session[:user_id] = nil
  "Good bye!"
end

get '/forgotten_password' do
  erb :forgotten_password
end

post '/forgotten_password' do
  #find user by email
  user = User.first(:email => params[:email])
  begin
    #is email and database email identical?
    user.email == params[:email]
    email = user.email
    generated_token = (1..64).map{('A'..'Z').to_a.sample}.join
    user.password_token = generated_token
    user.password_token_timestamp = Time.now
    user.save
    #send email with token and link
    send_recovery_email(generated_token,email)
  rescue
    erb :user_not_exist 
  end
end

get '/reset_password/:token' do
  user = User.first(:password_token => params[:token])
  begin 
    user.password_token == params[:token]
    @token = params[:token]
    erb :"users/reset_password"
  rescue
    erb :token_has_been_used
  end
end

post '/reset_password' do
  begin      
      #checks for identical password"
      params[:password] == params[:password_confirmation]
      #find User by token
      user = User.first(:password_token => params[:token])
      #set new password and hash it
      user.password_digest = BCrypt::Password.create(params[:password])
      #set token and timestamp nil
      user.password_token = nil
      user.password_token_timestamp = nil
      #save changes
      user.save
      erb :password_changed
  rescue
    erb :token_crash
  end
end
