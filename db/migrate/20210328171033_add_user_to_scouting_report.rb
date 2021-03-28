class AddUserToScoutingReport < ActiveRecord::Migration[5.2]
  def change
    add_reference :scouting_reports, :user
  end
end
