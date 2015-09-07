class PersonalEvent < ActiveRecord::Base
  belongs_to :person
  has_many :tags, as: :tagable

   scope :user_people, -> { where(person_id: current_user.people)}

end