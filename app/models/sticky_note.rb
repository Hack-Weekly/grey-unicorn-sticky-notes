class StickyNote < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
