class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates_presence_of :start_time
  validates_presence_of :end_time
end
