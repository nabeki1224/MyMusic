class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      t.references :end_user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :end_users }

      t.timestamps

      t.index [:end_user_id, :follow_id], unique: true
    end
  end
end
