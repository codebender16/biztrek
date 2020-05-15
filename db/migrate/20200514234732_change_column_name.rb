class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :is_admin?, :is_admin
    rename_column :users, :is_mentor?, :is_mentor
  end
end
