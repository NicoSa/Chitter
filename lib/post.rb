class Post

  include DataMapper::Resource

  property :id, 	Serial
  property :message, Text
  property :time, DateTime, :default => DateTime.now
  property :nickname, Text
  property :name, Text


  def display_all_posts
    @posts = Post.all(:order => [:time.desc])
  end

  def create_new_post(message, nickname, name)
    post_time = Time.now
    Post.create(:message => message, :time => post_time, :nickname => nickname, :name => name)
  end
end
