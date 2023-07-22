class StickyNote < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :whiteboard
end
