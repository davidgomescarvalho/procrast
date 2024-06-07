class Task < ApplicationRecord
  belongs_to :project

  validatable :title, presence: true
  validatable :start_date, presence: true
  validatable :end_date, presence: true
  
end
