require 'sinatra'
require 'sinatra/base'
require 'rack-flash'
require_relative './user.rb'
require_relative './email_controller.rb'
require_relative './post.rb'
require_relative './data_mapper_setup.rb'
require_relative './router/posts_router.rb'
require_relative './router/signup_router.rb'
require_relative './router/login_router.rb'
require_relative './router/user_router.rb'
require_relative './router/forgotten_password_router.rb'
require_relative './router/reset_password_router.rb'
include Email
include BCrypt

use Rack::Flash

enable :sessions
set :session_secret, 'super secret'
set :root, File.dirname(__FILE__)




