class CreateTradeItems < ActiveRecord::Migration
  def change
    create_table :trade_items do |t|

      t.timestamps null: false
    end
  end
end
