require 'sinatra'
require 'sinatra/base'
require 'rack-flash'
require_relative './user.rb'
require_relative './email_controller.rb'
require_relative './post.rb'
require_relative './data_mapper_setup.rb'
require_relative './posts_router.rb'
require_relative './signup_router.rb'
require_relative './login_router.rb'
require_relative './user_routes.rb'
require_relative './forgotten_password_routes.rb'
require_relative './reset_password_routes.rb'
include Email
include BCrypt

use Rack::Flash

enable :sessions
set :session_secret, 'super secret'
set :root, File.dirname(__FILE__)




