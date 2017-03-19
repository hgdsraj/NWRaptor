class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :vehicle_id, null: false
      t.integer :distance, null: false
      t.integer :fuel_efficiency, null: false
      t.timestamps
    end
  end
end
