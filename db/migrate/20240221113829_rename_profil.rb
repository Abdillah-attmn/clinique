class RenameProfil < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :profilable_id, :profile_id
    rename_column :users, :profilable_type, :profile_type
  end
end
