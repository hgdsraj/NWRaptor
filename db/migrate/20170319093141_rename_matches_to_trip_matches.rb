class RenameMatchesToTripMatches < ActiveRecord::Migration[5.0]
  def change
    rename_table :matches, :trip_matches
  end
end
