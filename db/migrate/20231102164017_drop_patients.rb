class DropPatients < ActiveRecord::Migration[7.0]
  def change
    drop_table :patients, if_exists: true
  end
end
