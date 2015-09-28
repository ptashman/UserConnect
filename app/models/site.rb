class Site < ActiveRecord::Base
  has_many :posts
  has_many :trade_items
  belongs_to :owner

  validates :name, uniqueness: { scope: :owner_id }

  def trade_list
    names = trade_items.map { |item| [item.name, item.name] }
  end
end