class AddNoNullProfileToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :profile_id, false
    change_column_null :users, :profile_type, false
  end
end
