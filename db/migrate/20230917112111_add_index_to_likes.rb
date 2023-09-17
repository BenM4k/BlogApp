class AddIndexToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :user_id, :text
    add_index :likes, :user_id
  end
end
