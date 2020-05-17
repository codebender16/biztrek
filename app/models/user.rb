class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :mentor, dependent: :destroy
  has_many :courses
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :user_type, presence: { if: 'user_type.nil?'}
  # validates :user_type - for user type mentor or student - is a radio button
  has_many :orders, dependent: :destroy
  # has_many :courses, through: :orders
  has_many :testimonials
  # has_many :courses, through: :testimonials
  has_one :cart, dependent: :destroy
end
