class HistoricalEvent < ActiveRecord::Base
  has_many :tags, as: :tagable

  default_scope { order(starting: :desc) }

end
