require 'bcrypt'
require 'data_mapper'

class User


	attr_reader :password
	attr_accessor :password_confirmation
	
	include DataMapper::Resource

	property :id, Serial
	property :email, String, :unique => true, :message => "This email is already taken"
	property :name, Text
	property :nickname, Text
	property :password_digest, Text
	property :password_token, Text
	property :password_token_timestamp, DateTime

	validates_uniqueness_of :email
	validates_confirmation_of :password

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
		user = first(:email => email)
			if user && BCrypt::Password.new(user.password_digest) == password
				user
			else
				nil
			end
	end

	def email_exist?(email)
		first(:email => email) == true
	end
end