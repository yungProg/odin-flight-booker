class AddStartDatetimeToFlight < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :start_datetime, :datetime
  end
end
