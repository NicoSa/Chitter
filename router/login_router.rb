post '/login' do
  email, password = params[:email], params[:password]
  @user = User.authenticate(email, password)
  if @user
    session[:user_id] = @user.id
    session[:nickname] = @user.nickname
    session[:name] = @user.name
    find_user = User.first(:email => params[:email])
    redirect to('/user_interface')
  else
    erb :"errors/wrong_login"
  end
end