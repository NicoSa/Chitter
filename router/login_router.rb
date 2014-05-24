post '/login' do
  email, password = params[:email], params[:password]
  authenticate_user(email,password)
  if @user
    establish_session
    find_user(email)
    redirect to('/user_interface')
  else
    erb :"errors/wrong_login"
  end
end
