class CreateAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trophy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
