class Tag < ActiveRecord::Base
  belongs_to :tagable, polymorphic: true

  scope :available, -> { Tag.uniq.pluck(:name)}
  validates_uniqueness_of :name, scope: :tagable_id, :message => 'You aleady tagged this event %{value}'

end
