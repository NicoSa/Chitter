require 'sinatra'
require 'sinatra/base'
require 'rack-flash'
require_relative './lib/user.rb'
require_relative './lib/email_controller.rb'
require_relative './lib/post.rb'
require_relative './lib/data_mapper_setup.rb'
require_relative './lib/modules/user_helper.rb'
require_relative './lib/modules/post_helper.rb'
require_relative './router/posts_router.rb'
require_relative './router/signup_router.rb'
require_relative './router/login_router.rb'
require_relative './router/user_router.rb'
require_relative './router/forgotten_password_router.rb'
require_relative './router/reset_password_router.rb'
include Email
include BCrypt
include UserHelper
include PostHelper

use Rack::Flash

enable :sessions
set :session_secret, 'super secret'
set :root, File.dirname(__FILE__)
