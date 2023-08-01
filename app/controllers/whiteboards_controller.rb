class WhiteboardsController < ApplicationController
  def new
    @workspace = Workspace.find(params[:workspace_id])
    @whiteboard = @workspace.whiteboards.build
    authorize @whiteboard
  end

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @whiteboard = @workspace.whiteboards.build(whiteboard_params)
    authorize @whiteboard

    if @whiteboard.save
      redirect_to @workspace, notice: 'Whiteboard was successfully created.'
    else
      render :new
    end
  end

  def show
    @whiteboard = Whiteboard.find(params[:id])
    authorize @whiteboard
  end

  private

  def whiteboard_params
    params.require(:whiteboard).permit(:title)  # add your whiteboard attributes here
  end
end
