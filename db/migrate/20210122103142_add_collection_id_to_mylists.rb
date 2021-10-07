class AddCollectionIdToMylists < ActiveRecord::Migration[5.2]
  def change
    add_column :mylists, :collection_id, :integer
  end
end
