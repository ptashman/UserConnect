class User < ActiveRecord::Base
  belongs_to :site
  has_many :posts

  def feed
    Post.feed_items(self)
  end
end
