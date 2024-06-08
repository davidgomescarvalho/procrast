class AddNullFalseToMigrations < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    change_column_null :users, :total_points, false
    change_column_null :users, :country, false
    change_column_null :users, :username, false
  end
end
