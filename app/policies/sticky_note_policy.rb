class StickyNotePolicy
  attr_reader :user, :sticky_note

  def initialize(user, sticky_note)
    @user = user
    @sticky_note = sticky_note
  end

  def update?
    user.admin? || !sticky_note.published?
  end
end
