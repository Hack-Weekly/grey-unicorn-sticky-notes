class Guest < ApplicationRecord
  include WorkspaceInitializable

  after_initialize :set_expiration, if: :new_record?

  belongs_to :last_viewed_workspace, class_name: "Workspace", optional: true

  has_many :workspaces,   as: :owner, dependent: :destroy
  has_many :sticky_notes, as: :owner, dependent: :destroy

  def role
    :guest
  end

  def has_role?(role)
    role == :guest
  end

  def name
    "Guest: #{id}"
  end

  private

  def set_expiration
    # Linked to associated cookie expiry set in ApplicationController#guest_identifier.
    self.expires_at = 1.month.from_now
  end
end
