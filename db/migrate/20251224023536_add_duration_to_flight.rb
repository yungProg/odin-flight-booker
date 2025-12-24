class AddDurationToFlight < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :duration, :integer
  end
end
