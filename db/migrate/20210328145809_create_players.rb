class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :org_id
      t.jsonb :info, default: {}, null: false

      t.timestamps
    end
  end
end
