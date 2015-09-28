class AddNameToTradeItems < ActiveRecord::Migration
  def change
  	add_column :trade_items, :name, :string
  end
end
