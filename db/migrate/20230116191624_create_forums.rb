class CreateForums < ActiveRecord::Migration[7.0]
  def change
    create_table :forums do |t|
      t.string :question
      t.string :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
