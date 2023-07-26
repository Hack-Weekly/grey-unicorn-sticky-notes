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
    @whiteboard_id = params[:whiteboard_id]
    @sticky_note = build_sticky_note_with_owner
    authorize(@sticky_note)
  end

  # GET /sticky_notes/1/edit
  def edit; end

  # POST /sticky_notes
  def create
    @sticky_note = build_sticky_note_with_owner(sticky_note_params)
    @whiteboard_id = sticky_note_params[:whiteboard_id]
    authorize(@sticky_note)
    respond_to do |format|
      if @sticky_note.save
        format.turbo_stream {}
        flash[:success] = "Sticky note created successfully."
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sticky_notes/1
  def update
    if @sticky_note.update(sticky_note_params)
      redirect_to @sticky_note
      flash[:success] = "Sticky note was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /sticky_notes/1
  def destroy
    @sticky_note.destroy
    redirect_to root_url
    flash[:alert] = "Sticky note was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sticky_note
    @sticky_note = StickyNote.find(params[:id])
    authorize(@sticky_note)
  end

  def build_sticky_note_with_owner(sticky_note_params = nil)
    StickyNote.new(sticky_note_params).tap do |sticky_note|
      sticky_note.owner = pundit_user
    end
  end

  # Only allow a trusted parameter "white list" through.
  def sticky_note_params
    params.require(:sticky_note).permit(:content, :color, :due_date, :active, :pinned, :whiteboard_id)
  end
end
