class RenameMatchesToTripMatches < ActiveRecord::Migration[5.0]
  def change
    rename_table :trip_matches, :trip_matches
  end
end
