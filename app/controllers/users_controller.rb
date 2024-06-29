class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def show
    @recent_trophies = @user.trophies.order(created_at: :desc).limit(3)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
