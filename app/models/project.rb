class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  # must_not_overlap with other projects
  # must_not_overlap :start_time, :end_time, scope: :user_id

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true
 

  after_create :update_user_points_plus

  after_create :project_completed

  after_destroy :update_user_points_minus


  private


  # def grant_trophy
  #   case user.projects.count
  #   when 1
  #     user.trophies << first_project
  #   when 5
  #     user.trophies << five_projects
  #   when 10
  #     user.trophies << ten_projects
  #   end
  # end

  def project_completed
    case status
    when "completed"
      user.increment!(:total_points, 20)
    end
  end

  def update_user_points_plus
    user.increment!(:total_points, 10)
  end

  def update_user_points_minus
    user.decrement!(:total_points, 10)
  end
end
