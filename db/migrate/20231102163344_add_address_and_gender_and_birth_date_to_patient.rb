class AddAddressAndGenderAndBirthDateToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :gender, :string
    add_column :patients, :birth_date, :date
    add_column :patients, :address, :string
    add_column :patients, :zipcode, :string
    add_column :patients, :city, :string
  end
end
