require "application_system_test_case"

class StickNotesTest < ApplicationSystemTestCase
  setup do
    @stick_note = stick_notes(:one)
  end

  test "visiting the index" do
    visit stick_notes_url
    assert_selector "h1", text: "Stick notes"
  end

  test "should create stick note" do
    visit stick_notes_url
    click_on "New stick note"

    fill_in "Body", with: @stick_note.body
    fill_in "Title", with: @stick_note.title
    click_on "Create Stick note"

    assert_text "Stick note was successfully created"
    click_on "Back"
  end

  test "should update Stick note" do
    visit stick_note_url(@stick_note)
    click_on "Edit this stick note", match: :first

    fill_in "Body", with: @stick_note.body
    fill_in "Title", with: @stick_note.title
    click_on "Update Stick note"

    assert_text "Stick note was successfully updated"
    click_on "Back"
  end

  test "should destroy Stick note" do
    visit stick_note_url(@stick_note)
    click_on "Destroy this stick note", match: :first

    assert_text "Stick note was successfully destroyed"
  end
end
