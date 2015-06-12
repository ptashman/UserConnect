class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :wants_item, :presence => true, :length => { :maximum => 140 }
  validates :has_item, :presence => true, :length => { :maximum => 140 }
  validates :user, presence: true
  #mount_uploader :wants_image, MicropostImageUploader
  #mount_uploader :has_image, MicropostImageUploader

  def self.feed_items(user)
    array = from_users_matched_with(user) + user.posts
    where(id: array.map(&:id))
  end

  def self.from_users_matched_with(user)
    has_items = user.posts.map(&:has_item)
    wants_items = user.posts.map(&:wants_item)
    (user.posts.where("wants_item IN (?)", has_items) + user.posts.where("has_item IN (?)", wants_items)).uniq
  end
end
