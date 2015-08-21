class Person < ActiveRecord::Base
  belongs_to :user
  has_many :personal_events
end
