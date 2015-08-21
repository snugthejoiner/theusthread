class Tag < ActiveRecord::Base
  # need to look at this for polymorphous relationship
  belongs_to :historical_event
end
