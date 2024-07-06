class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :projects, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :trophies, through: :achievements
  has_many :tasks, through: :projects
  has_many :notifications, dependent: :destroy

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :total_points, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :country, presence: true

  def player_level
    case total_points
    when 0..100
      "Bronze"
    when 100..300
      "Silver"
    else
      "Gold"
    end
  end
end
