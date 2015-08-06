class HistoricalEvent < ActiveRecord::Base
  has_many :tags
end
