class CreateMojiVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :moji_vehicles do |t|
      t.integer :user_id, null: false
      t.string :moji_vehicle_id, null: false
      t.integer :fuel_efficiency, null: false
      t.timestamps
    end
  end
end