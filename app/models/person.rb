class Person < ActiveRecord::Base
  belongs_to :user
  has_many :personal_events, dependent: :destroy
  validates :name, presence: true
  validates :born, presence: true

  default_scope { order(born: :desc) }

  def personal_evented?
    self.personal_events.present? == true
  end

  # Month D, YYYY
  def born_date
    self.born.strftime('%B %-d, %Y')
  end

  # DOW, Month D, YYYY
  def born_long_date
    self.born.strftime('%A, %B %-d, %Y')
  end

  # d. Month, D, YYYY
  def died_date
    if self.died.present? == true
      "d. #{self.died.strftime('%B %-d, %Y')}"
    else
      nil
    end
  end

  # died DOW, Month D, YYYY
  def died_long_date
    if self.died.present? == true
      "died #{self.died.strftime('%A, %B %-d, %Y')}"
    else
      ""
    end
  end

end
