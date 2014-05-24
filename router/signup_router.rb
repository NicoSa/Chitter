get '/signup/new' do
  erb :"user/new_user"
end

post '/signup' do
  create_new_user
  if @user.save && params[:password] == params[:password_confirmation]
    establish_session
    redirect to ('/user_interface')
  else
    erb :"errors/signup_taken"
  end
end
