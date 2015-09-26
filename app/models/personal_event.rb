class PersonalEvent < ActiveRecord::Base
  belongs_to :person
  has_many :tags, as: :tagable, :dependent => :destroy
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  scope :user_people, -> { where(person_id: User.current.people)}
  scope :personal_newest, -> { order(starting: :desc) }
  scope :personal_monthy, -> { where('extract(month from starting) = ?', Time.now.month)}

end
