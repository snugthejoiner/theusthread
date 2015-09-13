class Person < ActiveRecord::Base
  belongs_to :user
  has_many :personal_events, dependent: :destroy

  default_scope { order(born: :desc) }

  def born_date
    self.born.strftime('%B %-d, %Y')
  end

  def born_long_date
    self.born.strftime('%A, %B %-d, %Y')
  end

  def died_date
    if self.died.present? == true
      "d. #{self.died.strftime('%B %-d, %Y')}"
    else
      nil
    end
  end

  def died_long_date
    if self.died.present? == true
      "died #{self.died.strftime('%A, %B %-d, %Y')}"
    else
      ""
    end
  end

end
