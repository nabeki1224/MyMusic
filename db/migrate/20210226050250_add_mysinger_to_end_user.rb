class AddMysingerToEndUser < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :mysinger, :string
  end
end
