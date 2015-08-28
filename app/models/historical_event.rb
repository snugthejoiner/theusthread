class HistoricalEvent < ActiveRecord::Base
  has_many :tags, as: :tagable

  default_scope { order(starting: :desc) }

  def event_start
    self.starting.strftime('%m/%d/%Y')
  end

end
