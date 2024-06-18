class RemovePointsFromTrophies < ActiveRecord::Migration[7.1]
  def change
    remove_column :trophies, :points, :integer
  end
end
