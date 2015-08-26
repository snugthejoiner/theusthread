class Person < ActiveRecord::Base
  belongs_to :user
  has_many :personal_events

  default_scope { order(born: :desc) }
end
