class User < ApplicationRecord
  # before_save :update_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :mentor, dependent: :destroy
  has_many :courses
  validates_presence_of :first_name, :first_name
  has_many :orders, dependent: :destroy
  # has_many :courses, through: :orders
  has_many :testimonials
  # has_many :courses, through: :testimonials
  has_one :cart, dependent: :destroy

  # def update_role
  #   if is_mentor 
  #     is_student = false
  #   else
  #     is_student = true
  #   end
  #   p self
  # end
end
