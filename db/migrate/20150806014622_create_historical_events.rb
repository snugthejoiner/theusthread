class CreateHistoricalEvents < ActiveRecord::Migration
  def change
    create_table :historical_events do |t|
      t.string :description
      t.date :starting
      t.date :ending
      t.string :premilestone_status
      t.string :ongoing_status

      t.timestamps null: false
    end
  end
end
