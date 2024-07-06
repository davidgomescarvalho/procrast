class Project < ApplicationRecord
  attr_accessor :color
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

  def self.colors
    %w[#0a1045 #f9e900 #f6af65 #00c2d1 #6a041d #0a1045 #f9e900]
  end
end
