class RenameFlightIntegerOfFlightToDuration < ActiveRecord::Migration[8.1]
  def change
    rename_column :flights, :integer, :duration
  end
end
