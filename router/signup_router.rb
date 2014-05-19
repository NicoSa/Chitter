get '/signup/new' do
    erb :"user/new_user"
end

post '/signup' do
  @user = User.new(:email => params[:email],
                        :name => params[:name],
                        :nickname => params[:nickname],
                        :password => params[:password],
                        :password_confirmation => params[:password_confirmation])
  if @user.save && params[:password] == params[:password_confirmation]
    session[:user_id] = @user.id
    session[:nickname] = @user.nickname
    session[:name] = @user.name
    redirect to ('/user_interface')
  else 
    erb :"errors/signup_taken"
  end
end