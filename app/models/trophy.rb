class Trophy < ApplicationRecord
  has_one_attached :image
  validates :points, presence: true

  def points
    case projects.count
    when 1
      user.points += 10
    when 5
      user.points += 20
    when 10
      user.points += 30
    else
    end
  end

  def grant_trophy
  end
end
