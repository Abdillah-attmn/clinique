class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :category
end
