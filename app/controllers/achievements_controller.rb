class AchievementsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @achievements = Achievement.all
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

end
