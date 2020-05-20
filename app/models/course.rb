class Course < ApplicationRecord
  validates :title, :sub_title, presence: true
  validates :description, presence: true, length: { minimum: 10 , message: 'Please enter more than 10 letters'}
  validates :price, numericality: { message: "%{value} is not valid. Please enter numbers only"}
  # validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image
  has_many :orders
  # has_many :users, through: :orders
  has_many :courses_categories, dependent: :destroy
  has_many :categories, through: :courses_categories
  has_many :testimonials
  # has_many :users, through: :testimonials
  has_many :carts_courses
  has_many :carts, through: :carts_courses

  def display_currency
    '$' + sprintf('%.2f', (self.price))
  end
end
