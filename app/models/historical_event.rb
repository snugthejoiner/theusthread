class HistoricalEvent < ActiveRecord::Base
  has_many :tags, as: :tagable

  scope :newest, -> { order(starting: :desc) }
  scope :monthy, -> { where('extract(month from starting) = ?', Time.now.month)
 }

end
