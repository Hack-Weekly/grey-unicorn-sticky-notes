class Whiteboard < ApplicationRecord
  belongs_to :workspace
  has_many :sticky_notes, dependent: :destroy
end
