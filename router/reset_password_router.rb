get '/reset_password/:token' do
  begin
    find_user_by_token(params[:token])
    @user.password_token == params[:token]
    @token = params[:token]
    erb :"recovery/reset_password"
  rescue
    erb :"errors/token_has_been_used"
  end
end

post '/reset_password' do
  begin
    params[:password] == params[:password_confirmation]
    find_user_by_token(params[:token])
    create_new_password
    erb :"recovery/password_changed"
  rescue
    erb :"errors/token_crash"
  end
end
