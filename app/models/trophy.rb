class Trophy < ApplicationRecord
  has_one_attached :image
  validates :points, presence: true


  def grant_trophy

  end
end
