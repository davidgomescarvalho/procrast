class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
