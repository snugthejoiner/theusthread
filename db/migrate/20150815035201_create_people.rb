class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :born
      t.date :died
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
