class TrophiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @trophies = Trophy.all
  end

  def show
    @trophy = Trophy.find(params[:id])
  end
end
