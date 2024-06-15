class Trophy < ApplicationRecord
  has_one_attached :image
  validatable :points, presence: true
end
