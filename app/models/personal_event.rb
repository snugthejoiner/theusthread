class PersonalEvent < ActiveRecord::Base
  belongs_to :person
  has_many :tags, as: :tagable

  def pe_uid
    self.person.user.id
  end

end
