get '/user_interface' do
  if session[:user_id] != nil
    display_all_posts
    erb :"user/user_interface"
  else
    redirect to('/')
  end
end

delete '/logout' do
  destroy_session
  redirect to ('/')
end

