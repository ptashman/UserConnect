class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  default_scope -> { order('created_at DESC') }
  validates :wants_item, :presence => true, :length => { :maximum => 140 }
  validates :has_item, :presence => true, :length => { :maximum => 140 }
  validates :user, presence: true
  validates :site_id, presence: true
  #mount_uploader :wants_image, MicropostImageUploader
  #mount_uploader :has_image, MicropostImageUploader

  def self.feed_items(user)
    items = (matched_with(user) + posted_by(user)).uniq
    where(site_id: user.site_id, id: items.map(&:id))
  end

private

  def self.matched_with(user)
    has_items = posted_by(user).map(&:has_item)
    wants_items = posted_by(user).map(&:wants_item)
    (where("wants_item IN (?)", has_items) + where("has_item IN (?)", wants_items))
  end

  def self.posted_by(user)
    where(user_id: user.id)
  end
end
