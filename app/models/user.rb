class User < ApplicationRecord
  validates :lastname, presences: true
  validates :firstname, presences: true, uniqueness: { scope: :lastname }
  validates :gender, presences: true
  validates :birth_date, presences: true
  validates :country, presences: true
  validates :zipcode, presences: true
  validates :city, presences: true
  validates :phone_number, presences: true
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :lockable, :validatable
end
