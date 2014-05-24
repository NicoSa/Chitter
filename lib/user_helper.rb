module UserHelper

  def authenticate_user(email, password)
    @user = User.authenticate(email, password)
  end

  def find_user(email)
    @user = User.first(:email => email)
  end

  def establish_session
    session[:user_id] = @user.id
    session[:nickname] = @user.nickname
    session[:name] = @user.name
  end

  def create_new_user
    @user = User.new(:email => params[:email],
                     :name => params[:name],
                     :nickname => params[:nickname],
                     :password => params[:password],
                     :password_confirmation => params[:password_confirmation])
  end

end
