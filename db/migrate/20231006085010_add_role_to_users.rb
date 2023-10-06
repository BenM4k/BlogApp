class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |table|
      table.string :role, null: false, default: "default"
    end
  end
end
