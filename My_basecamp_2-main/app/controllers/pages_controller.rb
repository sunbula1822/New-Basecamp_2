class PagesController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]
   def home
    @posts = Project.all
  end 
  def show

  end

  def new
    @posts = Project.new
  end

  def create
    posts = Project.create(project_params)

    redirect_to project_path(@home)
  end

  def edit

  end

  def update
    @posts.update(project_params)

    redirect_to project_path(@project)
  end

  def destroy
    @posts.destroy

    redirect_to project_new_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id, :description) 
  end

  def current_project
    @posts = Project.find(params[:id])
  end
end
