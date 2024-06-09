class RenameProjectTimes < ActiveRecord::Migration[7.1]
  def change
    rename_column :projects, :start_date, :start_time
    rename_column :projects, :end_date, :end_time
  end
end
