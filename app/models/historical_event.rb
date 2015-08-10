class HistoricalEvent < ActiveRecord::Base
  has_many :tags

  default_scope { order(starting: :desc) }

end
