class CreateTrophies < ActiveRecord::Migration[7.1]
  def change
    create_table :trophies do |t|
      t.integer :points

      t.timestamps
    end
  end
end
