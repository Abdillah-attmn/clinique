class Forum < ApplicationRecord
  belongs_to :user
  validates_presence_of :question
end
