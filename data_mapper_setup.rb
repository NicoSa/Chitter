env = ENV["RACK_ENV"] || "development"
database_url = ENV["DATABASE_URL"] || "postgres://localhost/chitter_#{env}"

require 'data_mapper'
require 'dm-timestamps'
require_relative './post.rb'
require_relative './user.rb'
require_relative './chitter.rb'

DataMapper.setup(:default, database_url)

DataMapper.finalize

DataMapper.auto_upgrade!
