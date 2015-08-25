class ChangeTagToPolymorphic < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.references :tagable, polymorphic: true, index: true
    end
  end
end
