class PersonalEvent < ActiveRecord::Base
  belongs_to :person
  has_many :tags, as: :tagable

  def event_start
    self.starting.strftime('%m/%d/%Y')
  end

end