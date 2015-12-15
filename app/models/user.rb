class User < ActiveRecord::Base
  belongs_to :site
  has_many :posts

  validates :site_id, presence: true

  def feed
    Post.feed_items(self)
  end
end
