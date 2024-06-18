require 'faker'
require 'open-uri'

# Clear existing data
User.destroy_all
puts "Cleared the database."

# Seed the database
puts "Seeding the database..."
puts "Creating users..."

# Create a user

user1 = User.create!(
  email: "michelle@mabelle.com",
  username: "MicheMiche",
  password: 'password',
  first_name: "Michelle",
  last_name: "Mabelle",
  country: "France"
)
avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user1.avatar.attach(io: avatar, filename: "#{user1.first_name}.jpg", content_type: 'image/jpg')
user1.save!

user2 = User.create!(
  email: "bobmorane@contretoutchacal.com",
  username: "BobbyMo",
  password: 'password',
  first_name: "Bob",
  last_name: "Morane",
  country: "Anglais"
)
avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user2.avatar.attach(io: avatar, filename: "#{user2.first_name}.jpg", content_type: 'image/jpg')
user2.save!

user3 = User.create!(
  email: "davidgomescarvalho@gmail.com",
  username: "DavidTyson",
  password: 'password',
  first_name: "David",
  last_name: "Gomes Carvalho",
  country: "Portugal"
)


avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user3.avatar.attach(io: avatar, filename: "#{user3.first_name}.jpg", content_type: 'image/jpg')
user3.save!

user4 = User.create!(
  email: "wassim@coder.com",
  username: "Coder.io",
  password: 'password',
  first_name: "Wassim",
  last_name: "Badreddine ",
  country: "France"
)
avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user4.avatar.attach(io: avatar, filename: "#{user4.first_name}.jpg", content_type: 'image/jpg')
user4.save!

user5 = User.create!(
  email: "hu.ferrier@gmail.com",
  username: "Hufer02",
  password: 'password',
  first_name: "Hugo",
  last_name: "Ferrier",
  country: "France"
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
  country: "France"
)
avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user6.avatar.attach(io: avatar, filename: "#{user6.first_name}.jpg", content_type: 'image/jpg')
user6.save!

user7 = User.create!(
  email: "boris.paillard@gmail.com",
  username: "Papillard",
  password: 'password',
  first_name: "Boris",
  last_name: "Paillard",
  country: "France"
)
avatar = URI.open(Faker::Avatar.image(size: "500x500", format: "jpg"))
user7.avatar.attach(io: avatar, filename: "#{user7.first_name}.jpg", content_type: 'image/jpg')
user7.save!

puts "Created #{User.count} users."
puts "Creating Projects."

date1 = Date.new(2024, 07, 8)
date2 = Date.new(2024, 07, 14)

project1 = Project.create!(
  user: user3,
  title: "First Project",
  start_time: date1,
  end_time: date2,
  status: "Not started"
)
project1.save!

date3 = Date.new(2024, 07, 15)
date4 = Date.new(2024, 07, 16)

project2 = Project.create!(
  user: user3,
  title: "Dishes",
  start_time: date3,
  end_time: date4,
  status: "Not started"
)
project1.save!

date5 = Date.new(2024, 07, 20)
date6 = Date.new(2024, 07, 21)

project3 = Project.create!(
  user: user3,
  title: "Buy Chairs",
  start_time: date5,
  end_time: date6,
  status: "Not started"
)
project1.save!

date7 = Date.new(2024, 07, 22)
date8 = Date.new(2024, 07, 28)

project1 = Project.create!(
  user: user3,
  title: "Oil painting",
  start_time: date7,
  end_time: date8,
  status: "Not started"
)
project1.save!

puts "Created #{Project.count} projects."
# puts "Creating instruments..."

# # Create a post
# users = User.all

# locations = ["5 Avenue Anatole France, 75007 Paris, France", "Rue de Rivoli, 75001 Paris, France", "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France", "Place d'Armes, 78000 Versailles, France", "50170 Mont Saint-Michel, France", "70 Rue Saint-Jean, 69005 Lyon, France", "75004 Paris, France", "Château, 41250 Chambord, France", "Prom. des Anglais, 06000 Nice, France", "Pl. Stanislas, 54000 Nancy, France"]
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
#   # Instrument.last.photos.attach(io: photos, filename: "#{Instrument.last.title}.jpg", content_type: 'image/jpg')
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
