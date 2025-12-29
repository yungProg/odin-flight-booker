class AddFlightIdToPassenger < ActiveRecord::Migration[8.1]
  def change
    add_column :passengers, :flight_id, :integer
  end
end
