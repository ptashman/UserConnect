class Site < ActiveRecord::Base
  has_many :posts
  has_many :trade_items
  belongs_to :owner

  validates :name, presence: true, uniqueness: { scope: :owner_id }
  validates :subdomain, presence: true, uniqueness: true
  validates_format_of :subdomain, :with => /[a-zA-Z0-9][a-zA-Z0-9\-\.]+[a-zA-Z0-9]/i

  before_create :downcase_subdomain

  def trade_list
    names = trade_items.map { |item| [item.name, item.name] }
  end

  private

  def downcase_subdomain
    self.subdomain.downcase!
  end
end