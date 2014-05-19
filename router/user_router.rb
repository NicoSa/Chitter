get '/user_interface' do
  if session[:user_id] != nil
  @posts = Post.all(:order => [:time.desc])
  erb :"user/user_interface"
  else
  redirect to('/')
  end
end

delete '/logout' do
  session[:user_id] = nil
  session[:nickname] = nil
  session[:name] = nil 
  redirect to ('/')
end