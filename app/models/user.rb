class User < ApplicationRecord
  before_create :update_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :mentor, dependent: :destroy
  has_many :courses
  validates_presence_of :first_name, :last_name
  has_many :orders, dependent: :destroy
  has_many :purchased_courses, through: :orders, source: :course # class_name: 'Course', foreign_key: 'course_id'
  has_many :testimonials
  # has_many :courses, through: :testimonials
  has_one :cart, dependent: :destroy

  def update_role
  unless self.is_admin
      if self.is_mentor 
        self.is_student = false
      else
        self.is_student = true
      end
    end
  end

end
