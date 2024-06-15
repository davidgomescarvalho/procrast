class TasksController < ApplicationController
  before_action :set_project, only: :create

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project

    if @task.save
      grant_trophy
      flash[:notice] = 'Task was successfully created.'
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(@task.project)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:notice] = 'Task was successfully updated.'
      redirect_to tasks_path
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :start_date, :end_date)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def grant_trophy
    if @project.tasks.count == 1
      Trophy.create(points: 5)
    end
  end
end
