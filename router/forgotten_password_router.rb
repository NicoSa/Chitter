get '/forgotten_password' do
  erb :"recovery/forgotten_password"
end

post '/forgotten_password' do
  begin
    find_user(params[:email])
    generate_and_send_token
    erb :"recovery/please_check_email"
  rescue
    erb :"errors/user_not_exist"
  end
end
