class AddColumnsToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :uid, :string
    add_column :end_users, :image, :string
  end
end
