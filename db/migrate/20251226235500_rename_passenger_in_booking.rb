class RenamePassengerInBooking < ActiveRecord::Migration[8.1]
  def change
    rename_column :bookings, :passenger, :passenger_id
  end
end
