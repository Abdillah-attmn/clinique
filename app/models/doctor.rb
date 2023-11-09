class Doctor < ApplicationRecord
  has_one :user, as: :profile
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  validates_presence_of :speciality
end
