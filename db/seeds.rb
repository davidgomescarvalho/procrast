require 'faker'
require 'open-uri'

# Clear existing data
User.destroy_all
puts "Cleared the database."

# Seed the database
puts "Seeding the database..."
puts "Creating users..."

status = ["Not started", "In progress"]
Trophy.create!(
  name: "First Project",
  description: "You've created your first project!"
)

Trophy.create!(
  name: "5 Projects",
  description: "You've created 5 projects!"
)

Trophy.create!(
  name: "10 Projects",
  description: "You've created 10 projects!"
)

# Create a user

user1 = User.create!(
  email: "michelle@mabelle.com",
  username: "MicheMiche",
  password: 'password',
  first_name: "Michelle",
  last_name: "Mabelle",
  country: "France",
  total_points: rand(0..500)
)
avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user1.avatar.attach(io: avatar, filename: "#{user1.first_name}.jpg", content_type: 'image/jpg')


#Create a project

project1 = Project.create!(
  title: "Practice the banjo for my concert",
  start_time: "2024-07-01",
  end_time:"2024-07-04" ,
  status: status.sample,
  completed: false,
  user: user1
)

# Create Tasks

Task.create!(
  title: "Learn new chords",
  start_date:"2024-07-01" ,
  end_date:"2024-07-01" ,
  project: project1
)

Task.create!(
  title: "Practice scales",
  start_date:"2024-07-02" ,
  end_date:"2024-07-03" ,
  project: project1
)

Task.create!(
  title: "Concert",
  start_date:"2024-07-04" ,
  end_date:"2024-07-04" ,
  project: project1
)


# Create a project

Project.create!(
  title: "Rewatch Rupaul's Drag Race season 6",
  start_time: "2024-07-12",
  end_time: "2024-07-16",
  status: status.sample,
  completed: false,
  user: user1
)
user1.save!





# Create a user
user2 = User.create!(
  email: "bobmorane@contretoutchacal.com",
  username: "BobbyMo",
  password: 'password',
  first_name: "Bob",
  last_name: "Morane",
  country: "England",
  total_points: rand(0..500)
)
avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user2.avatar.attach(io: avatar, filename: "#{user2.first_name}.jpg", content_type: 'image/jpg')
user2.save!

# create a project
project1 = Project.create!(
  title: "Learn how to surf",
  start_time: "2024-07-10",
  end_time: "2024-07-20",
  status: status.sample,
  completed: false,
  user: user2
)

# create tasks
Task.create!(
  title: "Buy a surfboard",
  start_date: "2024-07-10",
  end_date: "2024-07-01",
  project: project1
)

Task.create!(
  title: "Take a surf lesson",
  start_date: "2024-07-02",
  end_date: "2024-07-02",
  project: project1
)

Task.create!(
  title: "Practice",
  start_date: "2024-07-03",
  end_date: "2024-07-10",
  project: project1
)




# Create a user
user3 = User.create!(
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
  user: user3
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
  start_date:"2024-07-07" ,
  end_date:"2024-07-10" ,
  project: project1
)

# Create a project

project2 = Project.create!(
  title: "Paint a picture",
  start_time: "2024-07-15",
  end_time: "2024-07-17",
  status: status.sample,
  completed: false,
  user: user3
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
user3.avatar.attach(io: avatar, filename: "#{user3.first_name}.jpg", content_type: 'image/jpg')
user3.save!






# Create a user
user4 = User.create!(
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
  user: user4
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
  start_date:"2024-07-19" ,
  end_date:"2024-07-24" ,
  project: project1
)

# create a project

project2 = Project.create!(
  title: "Cook some bread",
  start_time: "2024-07-28",
  end_time: "2024-07-29",
  status: status.sample,
  completed: false,
  user: user4
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
user4.avatar.attach(io: avatar, filename: "#{user4.first_name}.jpg", content_type: 'image/jpg')
user4.save!






# Create a user
user5 = User.create!(
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
  user: user5
)

project2 = Project.create!(
  title: "Take photos at the park",
  start_time: "2024-07-05",
  end_time: "2024-07-05",
  status: status.sample,
  completed: false,
  user: user5
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
  user: user5
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
user5.avatar.attach(io: avatar, filename: "#{user5.first_name}.jpg", content_type: 'image/jpg')
user5.save!






user6 = User.create!(
  email: "seb@lewagon.com",
  username: "Ssaunier",
  password: 'password',
  first_name: "Sebastien",
  last_name: "Saunier",
  country: "France",
  total_points: rand(0..500)
)

project1 = Project.create!(
  title: "Read a book",
  start_time: "2024-07-17",
  end_time: "2024-07-19",
  status: status.sample,
  completed: false,
  user: user6
)

Task.create!(
  title: "Choose a book",
  start_date: "2024-07-17",
  end_date: "2024-07-17",
  project: project1
)

Task.create!(
  title: "Read",
  start_date: "2024-07-17",
  end_date: "2024-07-19",
  project: project1
)

Project.create!(
  title: "Go to the cinema",
  start_time: "2024-07-15",
  end_time: "2024-07-15",
  status: status.sample,
  completed: false,
  user: user6
)

avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user6.avatar.attach(io: avatar, filename: "#{user6.first_name}.jpg", content_type: 'image/jpg')
user6.save!





# Create a user
user7 = User.create!(
  email: "boris.paillard@gmail.com",
  username: "Papillard",
  password: 'password',
  first_name: "Boris",
  last_name: "Paillard",
  country: "France",
  total_points: rand(0..500)
)
# Create projects
project1 = Project.create!(
  title: "Finish the MVP",
  start_time: "2024-07-05",
  end_time: "2024-07-07",
  status: status.sample,
  completed: false,
  user: user7
)

# create Tasks
Task.create!(
  title: "Create the landing page",
  start_date: "2024-07-05",
  end_date: "2024-07-05",
  project: project1
)

Task.create!(
  title: "Create the user dashboard",
  start_date: "2024-07-07",
  end_date: "2024-07-07",
  project: project1
)

Task.create!(
  title: "Create the admin dashboard",
  start_date: "2024-07-07",
  end_date: "2024-07-07",
  project: project1
)

Project.create!(
  title: "Do a photoshoot",
  start_time: "2024-07-15",
  end_time: "2024-07-17",
  status: status.sample,
  completed: false,
  user: user7
)

Project.create!(
  title: "Practice my ollies",
  start_time: "2024-07-20",
  end_time: "2024-07-20",
  status: status.sample,
  completed: false,
  user: user7
)


# Create an avatar
avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user7.avatar.attach(io: avatar, filename: "#{user7.first_name}.jpg", content_type: 'image/jpg')
user7.save!

puts "Created #{User.count} users with #{Project.count} projects and #{Task.count} tasks."


# puts "Creating instruments..."

# # Create a post
# users = User.all

# locations = ["5 Avenue Anatole France, 75007 Paris, France", "Rue de Rivoli, 75001 Paris, France", "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France", "Place d'Armes, 78000 Versailles, France", "50170 Mont Saint-Michel, France", "70 Rue Saint-Jean, 69005 Lyon, France", "75004 Paris, France", "Château, 41250 Chambord, France", "Prom. des Anglais, 07000 Nice, France", "Pl. Stanislas, 54000 Nancy, France"]
# availability = "Yes"
# before_title = ["Awesome", "Amazing", "Authentic", "Beautiful", "Classic", "Cool", "Elegant", "Fancy", "Fantastic", "Gorgeous", "Great", "Incredible", "Lovely", "Magnificent", "Marvelous", "Outstanding", "Perfect", "Remarkable", "Spectacular", "Stunning", "Superb", "Terrific", "Wonderful", "Wondrous"]
# status = ["Pending", "Confirmed", "Cancelled"]

# start_date = Faker::Date.forward(days: 30)
# end_date = start_date + rand(1..7).days

# # Create an instrument
#   #Banjo

# banjo1 = Instrument.create!(
#   title: before_title.sample + " " +"5-String Banjo",
#   category: "String",
#   body: "The banjo is a stringed instrument with a thin membrane stretched over a frame or cavity to form a resonator. The membrane is typically circular, and usually made of plastic, or occasionally animal skin. Early forms of the instrument were fashioned by Africans in Colonial America, adapted from several African instruments of similar design.",
#   price: rand(50..300),
#   user: users.sample,
#   location: locations.sample,
#   start_date: start_date,
#   end_date: start_date + rand(1..7).days,
#   availability: "Yes"
# )

# banjo1.photos.attach(io: URI.open("https://i.ebayimg.com/images/g/gqcAAOSwB-1Y1A9U/s-l1200.webp"), filename: "#{banjo1.title}.jpg", content_type: 'image/jpg')
# banjo1.photos.attach(io: URI.open("https://fr.euroguitar.com/images/products/gold-tone/cc-100r-cripple-creek-5-string-resonator-5c-med-189170.jpg"), filename: "#{banjo1.title}.jpg", content_type: 'image/jpg')
# banjo1.photos.attach(io: URI.open("https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_43/436254/14290848_800.jpg"), filename: "#{banjo1.title}.jpg", content_type: 'image/jpg')

# Booking.create!(
#   user: users.sample,
#   instrument: banjo1,
#   start_date: start_date,
#   end_date: start_date + rand(1..7).days,
#   status: status.sample,
# )

# 20.times do
#   instrument = Instrument.create!(
#     title: (before_title.sample.sample + " " + "#{Faker::Music.instrument}"),
#     body: Faker::Lorem.paragraph(sentence_count: 5),
#     category: categories.sample,
#     price: Faker::Commerce.price(range: 50..1000),
#     user: users.sample,
#     location: locations.sample,
#     start_date: start_date,
#     end_date: start_date + rand(1..7).days,
#     availability: availability.sample
#   )

#   instrument_name = instrument.title
#   url = "https://source.unsplash.com/300x300?#{instrument_name},instrument,#{instrument.category}"
#   puts instrument_name

#   photos_urls = [
#     url,
#     url,
#     url
#   ]
#   photos_urls.each do |url|
#     photos = URI.open(url)
#     instrument.photos.attach(io: photos, filename: "#{Instrument.last.title}.jpg", content_type: 'image/jpg')
#   end
#   # URI.open(Faker::LoremFlickr.image(size: "500x600", search_terms: ['instrument']))
#   # Instrument.last.photos.attach(io: photos, filename: "#{Instrument.last.title}.jpg", content_type:'image/jpg')
#   instrument.save!
#   puts "Seeded #{Instrument.count} instruments with #{instrument.photos.count} photos."
# end
# puts "Created #{Instrument.count} instruments with #{Instrument.photos.count} photos."
# puts "Created #{Instrument.count} instruments."

# puts "Creating bookings..."
# # Create a booking
# instruments = Instrument.all
# statuses = ["Pending", "Confirmed", "Cancelled"]

# 4.times do
#   start_date = Faker::Date.forward(days: 30)
#   end_date = start_date + rand(1..7).days

#   Booking.create!(
#     user: users.sample,
#     instrument: instruments.sample,
#     start_date: start_date,
#     end_date: end_date,
#     status: statuses.sample,
#     total_price: rand(50..1000)
#   )
# end
# puts "Created #{Booking.count} bookings."
# puts "Seeded #{User.count} users, #{Instrument.count} instruments, and #{Booking.count} bookings."
puts "Done seeding the database."

# photo: Faker::Avatar.image(size: "500x500", format: "jpg")
# photo: Faker::LoremFlickr.image(size: "50x60", search_terms: ['instrument'])
