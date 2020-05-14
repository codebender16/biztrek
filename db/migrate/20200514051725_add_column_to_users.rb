class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_mentor?, :boolean
  end
end
