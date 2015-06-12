class AddFieldsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :wants_item, :string
    add_column :posts, :wants_description, :string
    add_column :posts, :wants_image, :string
    add_column :posts, :has_item, :string
    add_column :posts, :has_description, :string
    add_column :posts, :has_image, :string
  end
end
