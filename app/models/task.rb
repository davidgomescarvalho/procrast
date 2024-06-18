class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  after_create :update_user_points_task_plus
  after_destroy :update_user_points_task_minus

  private

  def user
    project.user
  end

  def update_user_points_task_minus
    user.decrement!(:total_points, 5)
  end

  def update_user_points_task_plus
    user.increment!(:total_points, 5)
  end
end
