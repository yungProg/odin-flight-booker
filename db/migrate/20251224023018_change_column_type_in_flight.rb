class ChangeColumnTypeInFlight < ActiveRecord::Migration[8.1]
  def change
    remove_column :flights, :duration, :text
  end
end
