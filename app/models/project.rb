class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  # must_not_overlap with other projects
  # must_not_overlap :start_time, :end_time, scope: :user_id

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true

  after_create :update_user_points

  private

  def update_user_points
    case self.count += 1
    when 1
      user.increment!(:total_points, 10)
    end
  end
end
