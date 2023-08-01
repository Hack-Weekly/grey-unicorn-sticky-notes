class StickyNote < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :whiteboard
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def self.by_position
    order("position ASC")
  end
end
