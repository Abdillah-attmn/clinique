class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :speciality

      t.timestamps null: false
    end
  end
end
