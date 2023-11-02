class AddFirstnameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    remove_column :users, :full_name, :string
  end
end
