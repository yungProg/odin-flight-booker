class ChangeFlightDurationOfFlight < ActiveRecord::Migration[8.1]
  def change
    rename_column :flights, :duration, :integer
  end
end
