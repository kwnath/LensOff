class AddLenseToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :lense, foreign_key: true
  end
end
