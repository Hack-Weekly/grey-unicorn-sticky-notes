require "test_helper"

class StickNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sticky_note = sticky_notes(:one)
  end

  test "should get index" do
    get sticky_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_sticky_note_url
    assert_response :success
  end

  test "should create sticky_note" do
    assert_difference("StickNote.count") do
      post sticky_notes_url, params: { sticky_note: { body: @sticky_note.body, title: @sticky_note.title } }
    end

    assert_redirected_to sticky_note_url(StickNote.last)
  end

  test "should show sticky_note" do
    get sticky_note_url(@sticky_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_sticky_note_url(@sticky_note)
    assert_response :success
  end

  test "should update sticky_note" do
    patch sticky_note_url(@sticky_note), params: { sticky_note: { body: @sticky_note.body, title: @sticky_note.title } }
    assert_redirected_to sticky_note_url(@sticky_note)
  end

  test "should destroy sticky_note" do
    assert_difference("StickNote.count", -1) do
      delete sticky_note_url(@sticky_note)
    end

    assert_redirected_to sticky_notes_url
  end
end
