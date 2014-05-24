module PostHelper

  def display_all_posts
    @posts = Post.all(:order => [:time.desc])
  end

  def create_new_post(message, nickname, name)
    post_time = Time.now
    Post.create(:message => message, :time => post_time, :nickname => nickname, :name => name)
  end

end
