class TrophiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trophies = Trophy.all
    @trophiesDSC = @trophies.all.order(created_at: :desc)
  end

  def show
    @trophy = Trophy.find(params[:id])
  end
end
