class Category < ApplicationRecord
  has_many :courses_categories
  has_many :courses, through: :courses_categories
end
