class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer  "user_one_id"
      t.integer  "user_two_id"
      t.boolean  "user_one_confirmed"
      t.boolean  "user_two_confirmed"
      t.integer  "user_one_trip_id"
      t.integer  "user_two_trip_id"
      t.timestamps
    end
  end
end