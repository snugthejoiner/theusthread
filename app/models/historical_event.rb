class HistoricalEvent < ActiveRecord::Base
  has_many :tags, as: :tagable

  scope :newest, -> { order(starting: :desc) }

  def event_start
    self.starting.strftime('%m/%d/%Y')
  end

end
