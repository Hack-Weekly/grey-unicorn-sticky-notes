class StickyNotesController < ApplicationController
  before_action :set_sticky_note, only: [:show, :edit, :update, :destroy]

  # GET /sticky_notes
  def index
    @sticky_notes = policy_scope(StickyNote)
  end

  # GET /sticky_notes/1
  def show; end

  # GET /sticky_notes/new
  def new
    @sticky_note = build_sticky_note_with_owner
    authorize(@sticky_note)
  end

  # GET /sticky_notes/1/edit
  def edit; end

  # POST /sticky_notes
  def create
    @sticky_note = build_sticky_note_with_owner(sticky_note_params)
    authorize(@sticky_note)
    if @sticky_note.save
      redirect_to user_sticky_notes_url, notice: "Sticky note created successfully."
    else
      render :new
    end
  end

  # PATCH/PUT /sticky_notes/1
  def update
    if @sticky_note.update(sticky_note_params)
      redirect_to user_sticky_note_url(@sticky_note), notice: "Sticky note was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /sticky_notes/1
  def destroy
    @sticky_note.destroy
    redirect_to user_sticky_notes_url, notice: "Sticky note was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sticky_note
    @sticky_note = StickyNote.find(params[:id])
    authorize(@sticky_note)
  end

  def build_sticky_note_with_owner(sticky_note_params = nil)
    StickyNote.new(sticky_note_params).tap do |sticky_note|
      if user_signed_in?
        sticky_note.user = current_user
      else
        sticky_note.guest_id = guest_identifier
      end
    end
  end

  # Only allow a trusted parameter "white list" through.
  def sticky_note_params
    params.require(:sticky_note).permit(:title, :body, :user_id)
  end
end
