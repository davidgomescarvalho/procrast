class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :done, inclusion: { in: [true, false] }

  private

  def user
    project.user
  end
end
