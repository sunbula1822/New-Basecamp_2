class FilersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_filer, only: [:show, :edit, :update, :destroy]

  # GET projects/1/tasks
  def index
    # @filer = Filer.find[:id]
    @filers = @project.filers

  end

  # GET projects/1/tasks/1
  def show
      
  end

  # GET projects/1/tasks/new
  def new
    @filer = @project.filers.build
    @filers = @project.filers
  end

  # GET projects/1/tasks/1/edit
  def edit
  end

  # POST projects/1/tasks
  def create
    @filer = @project.filers.build(filer_params)

    if @filer.save
      redirect_to new_project_filer_path
    end
  end

  # PUT projects/1/tasks/1
  def update
    if @filer.update(filer_params)
      redirect_to new_project_filer_path
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/tasks/1
  def destroy
      @filer.destroy
          redirect_to new_project_filer_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_filer
      @filer = @project.filers.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def filer_params
      params.require(:filer).permit(:description, :project_id, :attach)
    end
end
