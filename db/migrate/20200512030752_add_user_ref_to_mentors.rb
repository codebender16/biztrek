class AddUserRefToMentors < ActiveRecord::Migration[6.0]
  def change
    add_reference :mentors, :user, null: false, foreign_key: true
  end
end
