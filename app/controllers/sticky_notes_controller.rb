class StickyNotesController < ApplicationController
  before_action :set_sticky_note, only: [:show, :edit, :update, :destroy, :move]

  def index
    @sticky_notes = policy_scope(StickyNote).by_position
  end

  def show; end

  def new
    @whiteboard_id = params[:whiteboard_id]
    @sticky_note = build_sticky_note_with_owner
    authorize(@sticky_note)
  end

  def edit; end

  def create
    @sticky_note = build_sticky_note_with_owner(sticky_note_params)
    @whiteboard_id = sticky_note_params[:whiteboard_id]
    authorize(@sticky_note)
    respond_to do |format|
      if @sticky_note.save
        format.turbo_stream {}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @sticky_note.update(sticky_note_params)
      redirect_to @sticky_note
      flash[:success] = "Sticky note was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @sticky_note.destroy
    redirect_to root_url
    flash[:alert] = "Sticky note was successfully destroyed."
  end

  def move
    @sticky_note.insert_at(params[:position].to_i)
  end

  private

  def set_sticky_note
    @sticky_note = StickyNote.find(params[:id])
    authorize(@sticky_note)
  end

  def build_sticky_note_with_owner(sticky_note_params = nil)
    StickyNote.new(sticky_note_params).tap do |sticky_note|
      sticky_note.owner = pundit_user
    end
  end

  def sticky_note_params
    params.require(:sticky_note).permit(:content, :color, :due_date, :active, :pinned, :whiteboard_id, :position)
  end
end
