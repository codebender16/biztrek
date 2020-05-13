class Mentor < ApplicationRecord
  belongs_to :user
  has_many :courses, dependent: :destroy
  validates :description, presence: true
  validates :expertise, presence: true 
  validates :business, presence: true 
  validates :industry, presence: true 
end
