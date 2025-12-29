class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :passenger

      t.timestamps
    end
  end
end
