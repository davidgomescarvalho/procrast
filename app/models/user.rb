class User < ApplicationRecord
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

  def player_level
    case points
    when 0..100
      "bronze"
    when 100..300
      "silver"
    when 300..500
      "gold"
    else
      "platine"
    end
  end
end
