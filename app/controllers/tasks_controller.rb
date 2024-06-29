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
      redirect_to project_path(@project), notice: 'Task was successfully created.'
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
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_path(@task.project), notice: 'Task was successfully updated.' }
        format.json { render json: { completion_percentage: @task.project.completion_percentage }  }
      else
        render :edit
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :start_date, :end_date, :done)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
