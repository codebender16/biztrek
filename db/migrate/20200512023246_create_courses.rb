class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :sub_title
      t.text :description
      t.int :price

      t.timestamps
    end
  end
end
