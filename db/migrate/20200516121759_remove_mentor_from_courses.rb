class RemoveMentorFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :courses, :mentor, null: false, foreign_key: true
  end
end
