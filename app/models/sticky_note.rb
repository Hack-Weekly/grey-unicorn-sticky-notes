class StickyNote < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :whiteboard

  def self.by_position
    order("position ASC")
  end
end
