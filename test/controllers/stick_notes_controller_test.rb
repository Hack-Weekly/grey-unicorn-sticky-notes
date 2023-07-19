require "test_helper"

class StickNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stick_note = stick_notes(:one)
  end

  test "should get index" do
    get stick_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_stick_note_url
    assert_response :success
  end

  test "should create stick_note" do
    assert_difference("StickNote.count") do
      post stick_notes_url, params: { stick_note: { body: @stick_note.body, title: @stick_note.title } }
    end

    assert_redirected_to stick_note_url(StickNote.last)
  end

  test "should show stick_note" do
    get stick_note_url(@stick_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_stick_note_url(@stick_note)
    assert_response :success
  end

  test "should update stick_note" do
    patch stick_note_url(@stick_note), params: { stick_note: { body: @stick_note.body, title: @stick_note.title } }
    assert_redirected_to stick_note_url(@stick_note)
  end

  test "should destroy stick_note" do
    assert_difference("StickNote.count", -1) do
      delete stick_note_url(@stick_note)
    end

    assert_redirected_to stick_notes_url
  end
end
