class AddIndexToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :text
    add_index :comments, :user_id
  end
end
