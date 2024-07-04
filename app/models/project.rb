class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  # must_not_overlap with other projects
  # must_not_overlap :start_time, :end_time, scope: :user_id

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true

  after_touch :set_completed

  def completion_percentage
    (tasks.where(done: true).count.fdiv(tasks.count) * 100).round(2)
  end

  def completed?
    completion_percentage == 100
  end

  def set_completed
    return unless completed? || status == "completed"

    self.status = "completed"
    user.increment!(:total_points, 50)
    save
  end

  def self.status
    ["not started", "in progress", "completed"]
  end
end
