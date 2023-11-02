class Patient < ApplicationRecord
  # lets just keep it user, rather than complicating it by naming account
  has_one user, as: :profile
end
