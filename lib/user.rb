require 'bcrypt'
require 'data_mapper'

class User


  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  validates_uniqueness_of :email
  validates_uniqueness_of :nickname
  validates_confirmation_of :password

  property :id, Serial
  property :email, String, :unique => false, :message => "This email is already taken"
  property :name, String, :unique => false, :message => "This name is already taken"
  property :nickname, String, :unique => false, :message => "This nickname is already taken"
  property :password_digest, Text
  property :password_token, Text
  property :password_token_timestamp, Text



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

end
