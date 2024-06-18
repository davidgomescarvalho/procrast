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


status = ["Not started", "In progress"]

trophy1 = Trophy.create!(
  name: "First Project",
  description: "You've created your first project!",
)
image = URI.open("https://cdn-icons-png.freepik.com/512/3311/3311367.png")
trophy1.image.attach(io: image, filename: "#{trophy1.name}.png", content_type: 'image/png')


trophy2 = Trophy.create!(
  name: "Just getting started",
  description: "You've just started your journey!"
)
image = URI.open("https://game-icons.net/images/project_papper.png")
trophy2.image.attach(io: image, filename: "#{trophy2.name}.png", content_type: 'image/png')

trophy3 = Trophy.create!(
  name: "5 Projects",
  description: "You've created 5 projects!"
)
image = URI.open("https://cdn12.picryl.com/photo/2016/12/31/medal-trophy-achievement-4260eb-1024.png")
trophy3.image.attach(io: image, filename: "#{trophy3.name}.png", content_type: 'image/png')

trophy4 = Trophy.create!(
  name: "10 Projects",
  description: "You've created 10 projects!"
)
image = URI.open("https://3dbay.io/files/preview/961x961/11696528407dmrww8ggykz1ftjzrcojoonhsbca6nlbdp35ogsl4ukuzfpbrhwsbkvhb5pi0trmzsgo2aayxw33asayfwgkxaho4fvqslmh6aai.png")
trophy4.image.attach(io: image, filename: "#{trophy4.name}.png", content_type: 'image/png')











# Create a user
user1 = User.create!(
  email: "davidgomescarvalho@gmail.com",
  username: "DavidTyson",
  password: 'password',
  first_name: "David",
  last_name: "Gomes Carvalho",
  country: "Portugal",
  total_points: rand(0..500)
)

# Create a project

project1 = Project.create!(
  title: "Learn how to play the guitar",
  start_time: "2024-07-01",
  end_time: "2024-07-10",
  status: status.sample,
  completed: false,
  user: user1
)

Task.create!(
  title: "Learn the basic chords",
  start_date: "2024-07-01",
  end_date: "2024-07-01",
  project: project1
)
Task.create!(
  title: "Learn the basic scales",
  start_date: "2024-07-02",
  end_date: "2024-07-02",
  project: project1
)
Task.create!(
  title: "Learn the basic songs",
  start_date: "2024-07-03",
  end_date: "2024-07-05",
  project: project1
)
Task.create!(
  title: "Practice",
  start_date: "2024-07-07",
  end_date: "2024-07-10",
  project: project1
)

# Create a project

project2 = Project.create!(
  title: "Paint a picture",
  start_time: "2024-07-15",
  end_time: "2024-07-17",
  status: status.sample,
  completed: false,
  user: user1
)

# Create tasks

Task.create!(
  title: "Choose a subject",
  start_date: "2024-07-15",
  end_date: "2024-07-15",
  project: project2
)

Task.create!(
  title: "Buy supplies",
  start_date: "2024-07-16",
  end_date: "2024-07-16",
  project: project2
)

Task.create!(
  title: "Paint",
  start_date: "2024-07-17",
  end_date: "2024-07-17",
  project: project2
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
  total_points: rand(0..500)
)

# Create a project

project1 = Project.create!(
  title: "Learn how to code",
  start_time: "2024-07-14",
  end_time: "2024-07-24",
  status: status.sample,
  completed: false,
  user: user2
)

Task.create!(
  title: "Learn the basics of HTML",
  start_date:"2024-07-14" ,
  end_date:"2024-07-14" ,
  project: project1
)

Task.create!(
  title: "Learn the basics of CSS",
  start_date:"2024-07-15" ,
  end_date:"2024-07-15" ,
  project: project1
)

Task.create!(
  title: "Learn the basics of JavaScript",
  start_date:"2024-07-16" ,
  end_date:"2024-07-18" ,
  project: project1
)

Task.create!(
  title: "Practice",
  start_date: "2024-07-19",
  end_date: "2024-07-24",
  project: project1
)

# create a project

project2 = Project.create!(
  title: "Cook some bread",
  start_time: "2024-07-28",
  end_time: "2024-07-29",
  status: status.sample,
  completed: false,
  user: user2
)

Task.create!(
  title: "Buy ingredients",
  start_date: "2024-07-28",
  end_date: "2024-07-28",
  project: project2
)

Task.create!(
  title: "Prepare the dough",
  start_date: "2024-07-28",
  end_date: "2024-07-28",
  project: project2
)

Task.create!(
  title: "Bake",
  start_date: "2024-07-29",
  end_date: "2024-07-29",
  project: project2
)

Task.create!(
  title: "Eat",
  start_date: "2024-07-29",
  end_date: "2024-07-29",
  project: project2
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
  total_points: rand(0..500)
)

# Create a project

Project.create!(
  title: "Clean my room",
  start_time: "2024-07-01",
  end_time: "2024-07-01",
  status: status.sample,
  completed: false,
  user: user3
)

project2 = Project.create!(
  title: "Take photos at the park",
  start_time: "2024-07-05",
  end_time: "2024-07-05",
  status: status.sample,
  completed: false,
  user: user3
)

Task.create!(
  title: "Choose a park",
  start_date: "2024-07-05",
  end_date: "2024-07-05",
  project: project2
)

Task.create!(
  title: "Take photos",
  start_date: "2024-07-05",
  end_date: "2024-07-05",
  project: project2
)

project3 = Project.create!(
  title: "Go to the gym",
  start_time: "2024-07-15",
  end_time: "2024-07-20",
  status: status.sample,
  completed: false,
  user: user3
)

Task.create!(
  title: "Choose a gym",
  start_date: "2024-07-15",
  end_date: "2024-07-15",
  project: project3
)

Task.create!(
  title: "Go to the gym",
  start_date: "2024-07-16",
  end_date: "2024-07-20",
  project: project3
)

avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user3.avatar.attach(io: avatar, filename: "#{user3.first_name}.jpg", content_type: 'image/jpg')
user3.save!


puts "Created #{User.count} users with #{Project.count} projects, #{Task.count} tasks and #{Trophy.count} trophies ! LEZGOOO."

puts "Done seeding the database."
