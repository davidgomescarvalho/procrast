class CreateInteractivities < ActiveRecord::Migration[7.1]
  def change
    create_table :interactivities do |t|

      t.timestamps
    end
  end
end
