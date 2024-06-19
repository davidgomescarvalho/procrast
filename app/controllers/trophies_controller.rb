class TrophiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trophies = Trophy.all
  end

  def show
    @trophy = Trophy.find(params[:id])
  end
end
