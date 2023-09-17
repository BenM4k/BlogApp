class AddIndexToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :author_id, :text
    add_index :posts, :author_id
  end
end
