class AddNameToTrophy < ActiveRecord::Migration[7.1]
  def change
    add_column :trophies, :name, :string
  end
end
