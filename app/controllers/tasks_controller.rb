class TasksController < ApplicationController
  before_action :set_project

  def index
    @tasks = @project.tasks
  end

  def show
    @task = task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    
    if @task.save
      redirect_to project_task_path(id: @task.id)
      # redirect_to project_task_path(id: @task.id) 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = task
  end

  def update
    @task = task

    if @task.update(task_params)
      redirect_to project_task_path(id: @task.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = task
    @task.delete

    redirect_to project_tasks_path
  end

  private

  def task
    @project.tasks.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline).merge({project: @project})
  end
end
