class Guest
  include ActiveModel::Model

  attr_reader :guest_id

  def initialize(guest_id)
    @guest_id = guest_id.to_s
  end

  def sticky_notes
    StickyNote.where(owner_type: "Guest", owner_id: guest_id)
  end

  def role
    :guest
  end

  def has_role?(role)
    role == :guest
  end
end
