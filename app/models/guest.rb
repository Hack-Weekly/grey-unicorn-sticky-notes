class Guest < ApplicationRecord
  after_initialize :set_expiration, if: :new_record?

  def sticky_notes
    StickyNote.where(owner_type: "Guest", owner_id: guest_id)
  end

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
