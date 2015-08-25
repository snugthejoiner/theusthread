class RemoveHistoricalEventIdFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :historical_event_id, :integer
  end
end
