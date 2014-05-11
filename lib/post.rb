class Post

	include DataMapper::Resource

	property :id, 	Serial
	property :message, Text
	property :time, DateTime, :default => DateTime.now
	property :nickname, Text

end
