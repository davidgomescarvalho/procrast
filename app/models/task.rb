class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
