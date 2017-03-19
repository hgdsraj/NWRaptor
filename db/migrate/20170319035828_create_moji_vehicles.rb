class CreateMojiVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :moji_vehicles do |t|
      t.integer :user_id
      t.string :moji_vehicle_id, null: false
      t.integer :fuel_efficiency
      t.timestamps
    end
  end
end