get '/' do
  display_all_posts
  erb :"user/index"
end

post '/' do
  message, name, nickname = params[:message], session[:name], session[:nickname]
  create_new_post(message, nickname, name)
  redirect to('/user_interface')
end
