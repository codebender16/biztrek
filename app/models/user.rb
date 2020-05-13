class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :mentor, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :orders, dependent: :destroy
  has_many :courses, through: :orders
  has_many :testimonials
  has_many :courses, through: :testimonials
  has_one :cart
end
