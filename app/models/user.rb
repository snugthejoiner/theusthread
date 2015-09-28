class User < ActiveRecord::Base
  has_many :people, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable

  validates :username, presence: true

  scope :subscribed, -> { where(subscribe: true)}

  def user_people_events
    if self.people.exists?
      self.people.each do |p|
        pe = p.personal_events
        return pe.count
      end
    else
      0
    end
  end

  def user_people_evented?
    self.user_people_events > 0
  end

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
end
