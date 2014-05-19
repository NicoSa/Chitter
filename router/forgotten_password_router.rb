get '/forgotten_password' do
  erb :"recovery/forgotten_password"
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
    erb :"recovery/please_check_email"
  rescue
    erb :"errors/user_not_exist"
  end
end

