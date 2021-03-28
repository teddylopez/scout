class CreateScoutingReports < ActiveRecord::Migration[5.2]
  def change
    create_table :scouting_reports do |t|
      t.references :player
      t.integer :report_type
      t.integer :grade
      t.jsonb :details, default: {}, null: false

      t.timestamps
    end
  end
end
