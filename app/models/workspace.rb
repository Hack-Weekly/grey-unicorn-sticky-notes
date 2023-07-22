class Workspace < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :whiteboards, dependent: :destroy

  validates :name, uniqueness: { scope: [:owner_id, :owner_type], message: "should be unique" }
end
