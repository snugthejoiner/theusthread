class User < ActiveRecord::Base
  has_many :people, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable

  validates :username, presence: true

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
end
