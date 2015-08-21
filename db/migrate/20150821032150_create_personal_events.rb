class CreatePersonalEvents < ActiveRecord::Migration
  def change
    create_table :personal_events do |t|
      t.string :description
      t.date :starting
      t.date :ending
      t.boolean :private
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
