class Trophy < ApplicationRecord
  has_one_attached :image

  def first_project
    Trophy.create(name: "First Project", image: "first_project.png", description: "You have created your first project!")
  end

  def five_projects
    Trophy.create(name: "5 Projects", image: "five_projects.png", description: "You have created 5 projects!")
  end

  def ten_projects
    Trophy.create(name: "10 Projects", image: "ten_projects.png", description: "You have created 10 projects!")
  end

  def project_completed
    Trophy.create(name: "Project Completed", image: "project_completed.png", description: "You have completed a project!")
  end

  def task_completed
    Trophy.create(name: "Task Completed", image: "task_completed.png", description: "You have completed a task!")
  end
end
