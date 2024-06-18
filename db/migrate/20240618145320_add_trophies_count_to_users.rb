class AddTrophiesCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :trophies_count, :integer, default: 0, null: false
  end
end
