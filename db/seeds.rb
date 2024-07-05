require 'faker'
require 'open-uri'

# Clear existing data
User.destroy_all
Trophy.destroy_all
Project.destroy_all
Task.destroy_all

puts "Cleared the database."

# Seed the database
puts "Seeding the database..."
puts "Creating users..."


trophy1 = Trophy.create!(
  name: "Just getting started",
  description: "You've just started your journey!"
)
image = URI.open("https://images.vexels.com/content/205873/preview/alarm-clock-stroke-icon-alarm-clock-f1e917.png")
trophy1.image.attach(io: image, filename: "#{trophy1.name}.png", content_type: 'image/png')


trophy2 = Trophy.create!(
  name: "First Project",
  description: "You've created your first project!",
)
image = URI.open("https://cdn-icons-png.freepik.com/512/3311/3311367.png")
trophy2.image.attach(io: image, filename: "#{trophy2.name}.png", content_type: 'image/png')


trophy3 = Trophy.create!(
  name: "Completionist",
  description: "You've completed your first project!"
)
image = URI.open("https://cdn-icons-png.flaticon.com/512/4721/4721040.png")
trophy3.image.attach(io: image, filename: "#{trophy3.name}.png", content_type: 'image/png')

trophy4 = Trophy.create!(
  name: "Getting the hang of it",
  description: "You've completed 5 projects!"
)
image = URI.open("https://cdn12.picryl.com/photo/2016/12/31/medal-trophy-achievement-4260eb-1024.png")
trophy4.image.attach(io: image, filename: "#{trophy4.name}.png", content_type: 'image/png')

trophy5 = Trophy.create!(
  name: "Reaching the stars",
  description: "You've completed 10 projects!"
)
image = URI.open("https://cdn-icons-png.flaticon.com/512/1734/1734167.png")
trophy5.image.attach(io: image, filename: "#{trophy5.name}.png", content_type: 'image/png')


trophy6 = Trophy.create!(
  name: "Rolling on tasks",
  description: "You've completed 10 tasks"
)
image = File.open(Rails.root.join("app", "assets", "images", "trophies", "rollers.png"))
trophy6.image.attach(io: image, filename: "#{trophy6.name}.png", content_type: 'image/png')


trophy7 = Trophy.create!(
  name: "The Weekender",
  description: "You've completed a week-long project!"
)

image = URI.open("https://cdn-icons-png.freepik.com/256/14883/14883510.png")
trophy7.image.attach(io: image, filename: "#{trophy7.name}.png", content_type: 'image/png')

trophy8 = Trophy.create!(
  name: "The King of projects",
  description: "You've completed a month-long project!"
)

image = URI.open("https://cdn4.iconfinder.com/data/icons/seo-internet-marketing-4-2/256/High-Quality_Content-512.png")
trophy8.image.attach(io: image, filename: "#{trophy8.name}.png", content_type: 'image/png')


trophy9 = Trophy.create!(
  name: "Wagonner",
  description: "You've presented your app to the world!"
)

image = URI.open("https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png")
trophy9.image.attach(io: image, filename: "#{trophy9.name}.png", content_type: 'image/png')


# Create a user
user1 = User.create!(
  email: "davidgomescarvalho@gmail.com",
  username: "DavidTyson",
  password: 'password',
  first_name: "David",
  last_name: "Gomes Carvalho",
  country: "Portugal",
  total_points: 295
)

avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user1.avatar.attach(io: avatar, filename: "#{user1.first_name}.jpg", content_type: 'image/jpg')
user1.save!

# Create a user
user2 = User.create!(
  email: "wassim@coder.com",
  username: "Coder.io",
  password: 'password',
  first_name: "Wassim",
  last_name: "Badreddine ",
  country: "France",
  total_points: 295
)


avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user2.avatar.attach(io: avatar, filename: "#{user2.first_name}.jpg", content_type: 'image/jpg')
user2.save!

# Create a user
user3 = User.create!(
  email: "hu.ferrier@gmail.com",
  username: "Hufer02",
  password: 'password',
  first_name: "Hugo",
  last_name: "Ferrier",
  country: "France",
  total_points: 295
)

User.all.each do |user|
  project_presentation = Project.create!(
    title: "Présenter son app",
    start_time: "01-07-2024",
    end_time: "06-07-2024",
    status: "In progress",
    completed: false,
    user: user
  )

  Task.create!(
    title: "Préparer le pitch",
    start_date: "02-07-2024",
    end_date: "02-07-2024",
    project: project_presentation
  )

  Task.create!(
    title: "Polir l'app",
    start_date: "15-07-2024",
    end_date: "24-07-2024",
    project: project_presentation
  )

  Task.create!(
    title: "Pleurer",
    start_date: "25-07-2024",
    end_date: "25-07-2024",
    project: project_presentation
  )

  Task.create!(
    title: "Présenter l'app",
    start_date: "26-07-2024",
    end_date: "26-07-2024",
    project: project_presentation
  )



  # Create a project

  project2 = Project.create!(
    title: "Peindre un portrait de Boris",
    start_time: "15-07-2024",
    end_time: "17-07-2024",
    status: "In progress",
    completed: false,
    user: user
    )

  # Create tasks

  Task.create!(
    title: "Acheter des fournitures",
    start_date: "15-07-2024",
    end_date: "15-07-2024",
    project: project2
  )

  Task.create!(
    title: "Acheter un cadre",
    start_date: "16-07-2024",
    end_date: "16-07-2024",
    project: project2
  )

  Task.create!(
    title: "Peindre le fond",
    start_date: "17-07-2024",
    end_date: "17-07-2024",
    project: project2
  )

  avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
  user3.avatar.attach(io: avatar, filename: "#{user3.first_name}.jpg", content_type: 'image/jpg')
  user3.save!
end

User.all.each do |user|
  user.trophies << trophy1
  user.trophies << trophy2
  user.trophies << trophy3
  user.trophies << trophy4
  user.trophies << trophy5
  user.trophies << trophy6
  user.trophies << trophy7
  user.trophies << trophy8
  user.trophies << trophy9
end

puts "Created #{User.count} users with #{Project.count} projects, #{Task.count} tasks and #{Trophy.count} trophies !"

puts "Done seeding the database."

puts "Seed completed!"
