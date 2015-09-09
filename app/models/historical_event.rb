class HistoricalEvent < ActiveRecord::Base
  has_many :tags, as: :tagable

  scope :newest, -> { order(starting: :desc) }

end
