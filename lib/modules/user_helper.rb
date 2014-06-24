module UserHelper

  def find_user_by_token(token)
    @user = User.first(:password_token => token)
  end

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

  def create_new_password
    @user.password_digest = BCrypt::Password.create(params[:password])
    @user.password_token = nil
    @user.password_token_timestamp = nil
    @user.save
  end

  def create_new_user
    @user = User.new(:email => params[:email],
                     :name => params[:name],
                     :nickname => params[:nickname],
                     :password => params[:password],
                     :password_confirmation => params[:password_confirmation])
  end

  def generate_and_send_token
    generated_token = (1..64).map{('A'..'Z').to_a.sample}.join
    @user.password_token = generated_token
    @user.password_token_timestamp = Time.now
    @user.save
    send_recovery_email(generated_token,params[:email])
  end

  def create_new_password
    @user.password_digest = BCrypt::Password.create(params[:password])
    @user.password_token = nil
    @user.password_token_timestamp = nil
    @user.save
  end

  def destroy_session
    session[:user_id] = nil
    session[:nickname] = nil
    session[:name] = nil
  end
end
