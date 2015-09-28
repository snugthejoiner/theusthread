class HistoricalEvent < ActiveRecord::Base
  has_many :tags, as: :tagable

  scope :ongoing, -> { where('ongoing_status' != nil) }
  scope :newest, -> { order(starting: :desc) }
  scope :monthy, -> { where('extract(month from starting) = ?', Time.now.month)
 }

  def self.ongoing_started(history_date)
    where("ending >= ?", history_date)
  end

  def self.ongoing_unfinished(history_date)
    where("starting <= ?", history_date)
  end

end
