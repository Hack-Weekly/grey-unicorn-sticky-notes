class StickyNote < ApplicationRecord
  belongs_to :owner, class_name: "User", polymorphic: true
  belongs_to :whiteboard
  acts_as_list
end
