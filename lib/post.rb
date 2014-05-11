class Post

	include DataMapper::Resource

	property :id, 	Serial
	property :message, Text
	property :time, Text#Time, :default => Time.now
	property :nickname, Text

end
