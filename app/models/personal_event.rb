class PersonalEvent < ActiveRecord::Base
  before_save :concatenate_details

  include ActiveModel::Validations
  belongs_to :person
  has_many :tags, as: :tagable, :dependent => :destroy
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true
  validates_presence_of(:description, :message => "can't be empty")
  validates_presence_of(:starting)
  validates_with PersonalEventValidator

  def concatenate_details
     self.description = "#{self.person.name} #{self.description[0, 1].downcase + self.description[1..-1]}"
  end

  def snip_off_person
    unless self.description.nil?
      self.description.sub(self.person.name.to_s, "").lstrip
    end
  end

  def self.personal_started(history_date)
    where("ending > ?", history_date)
  end

  def self.personal_unfinished(history_date)
    where("starting <= ?", history_date)
  end

  def ongoing?
    self.ending.present?
  end

  scope :user_people, -> { where(person_id: User.current.people)}
  scope :personal_newest, -> { order(starting: :desc) }
  scope :personal_monthy, -> { where('extract(month from starting) = ?', Time.now.month)}

end
