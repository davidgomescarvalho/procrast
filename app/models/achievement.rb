class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :trophy

  validates :user_id, presence: true
  validates :trophy_id, presence: true
end
