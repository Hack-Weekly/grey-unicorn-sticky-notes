class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :destroy]

  def index
    @workspaces = policy_scope(Workspace)
  end

  def show; end

  def new
    @workspace = build_workspace_with_owner
    authorize(@workspace)
  end

  def edit; end

  def create
    @workspace = build_workspace_with_owner(workspace_params)
    authorize(@workspace)
    if @workspace.save
      redirect_to root_url
      flash[:success] = "Workspace created successfully."
    else
      render :new
    end
  end

  def update
    if @workspace.update(workspace_params)
      redirect_to @workspace
      flash[:success] = "Workspace was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @workspace.destroy
    redirect_to root_url
    flash[:alert] = "Workspace was successfully destroyed."
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
    authorize(@workspace)
  end

  def build_workspace_with_owner(workspace_params = nil)
    Workspace.new(workspace_params).tap do |workspace|
      workspace.owner = pundit_user
    end
  end

  def workspace_params
    params.require(:workspace).permit(:name)
  end
end
