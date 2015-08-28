class PersonalEvent < ActiveRecord::Base
  belongs_to :person
  has_many :tags, as: :tagable
  
  default_scope { order(starting: :desc) }
end
