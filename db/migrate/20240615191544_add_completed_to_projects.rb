class AddCompletedToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :completed, :boolean, default: false
  end
end
