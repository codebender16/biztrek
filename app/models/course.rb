class Course < ApplicationRecord
  belongs_to :mentor
  has_many :courses_categories
  has_many :categories, through: :courses_categories
end
