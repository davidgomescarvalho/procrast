class User < ApplicationRecord
  has_merit

  after_save :update_level_based_on_points


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :projects, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :trophies, through: :achievements
  has_many :notifications, dependent: :destroy

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :country, presence: true
  validates :total_points, presence: true

  def update_level_based_on_points
    current_points = self.current_points
    new_level = LEVELS.reverse.find { |l| current_points >= l[:points_required] }[:level]

    update_column(:level, new_level) if level != new_level
  end
end
