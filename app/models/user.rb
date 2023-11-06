class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, :validatable,
         # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]
  belongs_to :profile, polymorphic: true
  validates :firstname, presence: true
  validates :lastname, presence: true, uniqueness: {scope: :firstname}
  validates :phone_number, format: { with: /^
                          (?:(?:\+|00)33|0)     # Dialing code
                          \s?[1-9]              # First number (from 1 to 9)
                          (?:[\s.-]?\d{2}){4}   # End of the phone number
                          $/}


  def role
    profile.profile_type.downcase # 'admin', 'doctor' or 'patient'
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
    end
  end

end
