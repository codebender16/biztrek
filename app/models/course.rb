class Course < ApplicationRecord
  belongs_to :mentor
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  has_many :courses_categories, dependent: :destroy
  has_many :categories, through: :courses_categories
  has_many :testimonials
  has_many :users, through: :testimonials
  has_many :carts_courses
  has_many :carts, through: :carts_courses

  def display_currency
    '$' + sprintf('%.2f', (self.price))
  end
end
