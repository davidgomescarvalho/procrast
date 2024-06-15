class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  after_create :grant_trophy
  after_destroy :grant_trophy

  def user
    project.user
  end
end
