class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lense
  # Attach validations:
  # t.datetime "start_date"
  # t.datetime "end_date"
end
