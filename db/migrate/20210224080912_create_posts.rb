class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.text :tweet
    	t.integer :end_user_id
        t.timestamps
    end
  end
end
