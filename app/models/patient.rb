class Patient < ApplicationRecord
  # lets just keep it user, rather than complicating it by naming account
  has_one :user, as: :profile
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  validates_presence_of :birth_date
  validates_presence_of :user
end
