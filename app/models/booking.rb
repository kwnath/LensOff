class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lense
  validates :start_date, presence: true
  validates :end_date, presence: true
  # Attach validations:
  # t.datetime "start_date"
  # t.datetime "end_date"
end
