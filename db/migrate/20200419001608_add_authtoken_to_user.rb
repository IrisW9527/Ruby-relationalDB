class AddAuthtokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :autotoken, :string, default: ""
    add_index :users, :autotoken, unique: true
  end
end
