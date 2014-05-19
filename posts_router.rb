get '/' do
  @posts = Post.all(:order => [:time.desc])
  erb :"user/index"
end

post '/' do
  post_time = Time.now
  Post.create(:message => params[:message], :time => post_time, :nickname => session[:nickname], :name => session[:name])  
  redirect to('/user_interface')
end