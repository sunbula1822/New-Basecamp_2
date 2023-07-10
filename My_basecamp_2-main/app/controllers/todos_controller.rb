class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET projects/1/todos
  def index
    @todos = @project.todos.order(created_at: :desc)
  end

  # GET projects/1/todos/1
  def show
      @users = User.all
  end

  # GET projects/1/todos/new
  def new
    @todo = @project.todos.build
    @todos = @project.todos
  end

  # GET projects/1/todos/1/edit
  def edit
  end

  # POST projects/1/todos
  def create
    @todo = @project.todos.build(todo_params)

    if @todo.save
      redirect_to new_project_todo_path
    else
      render action: 'new'
    end
  end

  # PUT projects/1/todos/1
  def update
    if @todo.update(todo_params)
      redirect_to new_project_todo_path
    end
  end

  # DELETE projects/1/todos/1
  def destroy
      @todo.destroy
          redirect_to new_project_todo_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_todo
      @todo = @project.todos.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:name)
    end
end