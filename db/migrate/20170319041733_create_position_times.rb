class CreatePositionTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :position_times do |t|
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.decimal :trip_id
      t.datetime :time
      t.string :type
      t.timestamps
    end
  end
end