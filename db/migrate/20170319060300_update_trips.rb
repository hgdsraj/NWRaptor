class UpdateTrips < ActiveRecord::Migration[5.0]
  def up
    change_column :trips, :fuel_efficiency, :float
    change_column :trips, :distance, :float
    add_column :trips, :gas_used, :float
  end
end
