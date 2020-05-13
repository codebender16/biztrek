class Cart < ApplicationRecord
  belongs_to :user
  has_many :carts_courses
  has_many :courses, through: :carts_courses
end
