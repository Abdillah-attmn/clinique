class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :confirmable, :timeoutable and :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  # Polymorphism Associations
  belongs_to :profile, polymorphic: true
  validates_presence_of :profile

  # Validations
  validates :firstname, presence: true
  validates :lastname, presence: true, uniqueness: {scope: :firstname}
  validates :phone_number, format: { with: /\A(?:(?:\+|00)33|0)\s?[1-9](?:[\s.-]?\d{2}){4}\z/}

  def set_patient_profile
    c = Patient.new
    self.profile = c
  end

  def set_doctor_profile
    d = Doctor.new
    self.profile = d
  end
end
