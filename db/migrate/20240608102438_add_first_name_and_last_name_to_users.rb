class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :total_points, :integer
    add_column :users, :country, :string
  end
end