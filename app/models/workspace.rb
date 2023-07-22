class Workspace < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
