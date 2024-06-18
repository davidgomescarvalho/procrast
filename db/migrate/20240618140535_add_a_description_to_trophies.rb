class AddADescriptionToTrophies < ActiveRecord::Migration[7.1]
  def change
    add_column :trophies, :description, :string
  end
end
