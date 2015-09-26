class AddSiteIdToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :site_id, :integer
  end
end
