class RemovePassengerIdFromBooking < ActiveRecord::Migration[8.1]
  def change
    remove_column :bookings, :passenger_id, :integer
  end
end
