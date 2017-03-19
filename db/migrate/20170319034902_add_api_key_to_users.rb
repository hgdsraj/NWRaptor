class AddApiKeyToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      ## Database authenticatable
      t.string :api_key, null: false
      add_index :users, :api_key, unique: true
    end
  end
end
