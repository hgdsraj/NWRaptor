class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :moji_vehicle_id
      t.integer :distance
      t.integer :fuel_efficiency
      t.timestamps
    end
  end
end
