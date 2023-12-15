class RemoveConfirmableFromUser < ActiveRecord::Migration[7.0]
  def change
    def self.down
      remove_column :users, :confirmation_token, :string
      remove_column :users, :confirmed_at,       :datetime
      remove_column :users, :confirmation_sent_at , :datetime
      remove_column :users, :unconfirmed_email, :string

      remove_index  :users, :confirmation_token, unique: true
    end
  end
end
