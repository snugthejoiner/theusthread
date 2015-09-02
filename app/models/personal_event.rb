class PersonalEvent < ActiveRecord::Base
  belongs_to :person
  has_many :tags, as: :tagable

  current_user = User.last

  scope :user_people, -> { where(person_id: current_user.people)}

end