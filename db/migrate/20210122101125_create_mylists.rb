class CreateMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :mylists do |t|

      t.integer :end_user_id
      t.integer :track_id

      t.timestamps
    end
  end
end
