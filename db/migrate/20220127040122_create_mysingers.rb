class CreateMysingers < ActiveRecord::Migration[6.1]
  def change
    create_table :mysingers do |t|
      t.integer :end_user_id
      t.integer :artist_id
      t.string :name
      t.timestamps
    end
  end
end
