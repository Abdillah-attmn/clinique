class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :gender
      t.date :birth_date
      t.string :address
      t.string :zipcode
      t.string :city

      t.timestamps null:false
    end
  end
end
