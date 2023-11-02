class Doctor < ApplicationRecord
  has_one :user, as: :profile
end
