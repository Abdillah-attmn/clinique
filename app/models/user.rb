class User < ApplicationRecord
  has_many :posts
  has_many :forums
  has_many :applications
  validates :lastname, presence: true
  validates :firstname, presence: true, uniqueness: { scope: :lastname }
  validates :gender, presence: true
  validates :birth_date, presence: true
  validates :country, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :lockable, :validatable
end
