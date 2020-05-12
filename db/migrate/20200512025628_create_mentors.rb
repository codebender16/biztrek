class CreateMentors < ActiveRecord::Migration[6.0]
  def change
    create_table :mentors do |t|
      t.text :description
      t.string :expertise
      t.string :business
      t.string :industry

      t.timestamps
    end
  end
end
