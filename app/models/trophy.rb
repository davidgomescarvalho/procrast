class Trophy < ApplicationRecord

  validatable :points, presence: true
end
