get '/reset_password/:token' do
  user = User.first(:password_token => params[:token])
  begin 
    user.password_token == params[:token]
    @token = params[:token]
    erb :"recovery/reset_password"
  rescue
    erb :"errors/token_has_been_used"
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
      erb :"recovery/password_changed"
  rescue
    erb :"errors/token_crash"
  end
end
