
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to user_project_path(current_user, @project), notice: 'Your Project was successfully created.'
    else
      flash[:alert] = @project.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    if @project.update(project_params)
      redirect_to user_project_path(current_user, @project), notice: 'Your Project was successfully updated.'
    else
      flash[:alert] = @project.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to user_projects_path(@project.user)
  end

  def calendar
    @projects = current_user.projects.to_a
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :status, :end_time, :start_time)
  end
end
