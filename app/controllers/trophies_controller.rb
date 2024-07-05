class TrophiesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @trophies = Trophy.all.where.not(name: "Wagonner")
    # @trophiesDSC = @trophies.all.order(created_at: :desc)
    @trophiesDSC = Trophy.all.order(created_at: :desc)
  end

  def show
    @trophy = Trophy.find(params[:id])
  end
end
