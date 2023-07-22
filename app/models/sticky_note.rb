class StickyNote < ApplicationRecord
  belongs_to :user, optional: true
end
