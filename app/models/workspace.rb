class Workspace < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :whiteboards, dependent: :destroy
end
