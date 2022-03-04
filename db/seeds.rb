# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Evaluation.destroy_all
Review.destroy_all
Booking.destroy_all
Service.destroy_all
User.destroy_all

usernames = ["shaquille_oatmeal", "hanging_with_my_gnomies", "hoosier_daddy", "fast_and_curious", "averagestudent", "BadKarma", "google_was_my_idea", "whats_my_name", "where_am_i", "wheelp4lyf", "mr_lewagon", "ms_lewagon", "806_or_die"]
names = ["Bobby", "Roy", "Jose", "Alex", "Ismael", "Ibrahim", "Rob", "Dick", "Bill", "Auston", "Alice", "Laura", "Margaret", "Cindy", "Grace"]
surnames = ["Brown", "Green", "Smith", "Jameson", "Gudbranson", "Velasquez", "Khan", "Goldman", "Lee", "Ozols"]
experts_photos = [
  "https://c.stocksy.com/a/TW3700/z9/1681841.jpg",
  "https://www.liveabout.com/thmb/oR_kgnRY47YAD6N5TRlpEYJTCtw=/2064x1161/smart/filters:no_upscale()/GettyImages-522272311-5949bdc15f9b58d58a035319.jpg",
  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pmx040118-mechanics002-1521726026.jpg",
  "https://www.sait.ca/images/Programs%20and%20Courses/Apprenticeships%20and%20Trades/Apprenticeships/motorcycle-mechanic.jpg",
  "https://i.pinimg.com/564x/b1/db/cc/b1dbccf5b65df457310bbdf8f6ab3fa8.jpg",
  "https://www.arabnews.pk/sites/default/files/styles/n_670_395/public/2021/07/24/2730671-1458449640.jpg?itok=ntDGNREm",
  "https://i0.wp.com/ericscarcare.com/wp-content/uploads/car_enthusiast.jpeg?fit=1200%2C900&ssl=1",
  "https://media.thetab.com/blogs.dir/115/files/2017/05/img-5299.jpg",
  "https://www.theargus.co.uk/resources/images/13278897.jpg?display=1&htype=0&type=responsive-gallery",
  "https://ctp-media.imigino.com/image/1/process/1200x600?source=https://randfonteinherald.co.za/wp-content/uploads/sites/3/2020/10/IMG_7469_44133_tn.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUfSXDk_CkDViwFI8BgS5ETtUtx_rt8kkm7YIyQPo9GP1sOuFojm9qjBvoh6CGItxLFmc&usqp=CAU",
  "https://acekarts.com.au/assets/Uploads/10-things-only-car-lovers-would-understand-social-image.jpg",
  "https://www.arabnews.com/sites/default/files/styles/n_670_395/public/2017/03/11/870556-1493855036.jpg?itok=cFUo7wwo",
  "https://static1.hotcarsimages.com/wordpress/wp-content/uploads/2019/01/Faye-Hadleymechanics.jpg?q=50&fit=crop&w=1600&dpr=1.5",
  "https://i.ytimg.com/vi/sS325i_bVCc/maxresdefault.jpg",
  "https://carleasespecialoffers.co.uk/assets/images/trista-schieffer-pw-post.jpg"
]

#---------USERS
customers = []
experts = []
usernames.each do |user|
  new_user = User.new(
    username: user,
    email: "#{user[0..4]}@email.com",
    password: "123456",
    first_name: names.sample,
    last_name: surnames.sample,
    expert: [true, false].sample
  )
  new_user.save!
  if new_user.expert
    experts << new_user.id
  else
    customers << new_user.id
  end
  puts "user #{user} created"
end


#-------- SERVICES

services = []

character_adjectives = %w[helpful wheelpful sincere serious professional truthworthy knowledgeable passionate thoughtful nice]
vehicles = %w[vehicle car motorbike van four-wheel convertible SUV minivan pickup limousine scooter micro-car familiar]
vehicle_adjectives = %w[vintage automatic luxury easy-to-drive small low-emission electric]
good_adjectives = %w[perfect great amazing high-end awesome exquisite brilliant gorgeous helpful sincere]
categories = %w[expert enthusiast specialist skilled mechanic technician service]
price_adjectives = %w[affordable reasonable inexpensive reduced discounted modest moderate]
verbs = [
  "loves",
  "enjoys",
  "works with",
  "owns #{1..4}",
  "likes"
]
timing = [
  "long time",
  "amateour",
  "new",
  ""
]

addresses = %w[London Dublin Paris Berlin Rome Milan Kairo Latvia Bilbao Sevilla Barcelona Bristol Athens Lion Madrid Norway]
availability = []
30.times do |i|
  date = Date.today + i
  availability << date
end
(1..20).each do |n|
  unavailability = []
  availability.count.times do |i|
    action = [true, false]
    if action.sample
      date = Date.today + i
      unavailability << date
    end
  end
  character = character_adjectives.sample
  vehicle = vehicles.sample
  vehicle_adjective = vehicle_adjectives.sample
  category = categories.sample
  address = addresses.sample
  price_adjective = price_adjectives.sample
  actions = [
    "help you find a #{vehicle_adjective} vehicle",
    "help you find the perfect #{vehicle}",
    "check the #{vehicle} for you",
    "verify the condition any #{vehicle} for you",
    "assist you in your next #{vehicle} purchase",
    "offering #{price_adjective} priced service",
    "helps you finding a #{vehicle} at a #{price_adjectives} price"
  ]
  wheelp = [
    "I love offering my service in Wheelp",
    "I've been a wheelper for a long time now",
    "I'm new to Wheelp",
    "I discovered wheelp a couple of months ago",
    "I used Wheelp a couple of years ago as a customer and a few months ago I decided to become a wheelper",
    "I joined Wheelp some years ago",
    "I'm a reputable long time wheelper",
  ]

  phrase = [
    "I love offering my service in Wheelp for people in #{address}",
    "I love wheelping people in #{address}",
    "I take this very seriously",
    "This is a service I actually enjoy doing",
    "This is the perfect way to get involved with #{vehicles} I like while making some extra cash"
  ]

  contact_phrase = [
    "please feel free to get in touch with me",
    "please don't hesitate to ask me any question",
    "I would love to check the vehicle for you",
    "feel free to ask me any question regarding your vehicle or my service",
    "let me know what you are looking for in your #{vehicle} and book a vehicle viewing with me",
    "I'm sure I can be super wheelpful to you.",
    "I'm usually booked but make sure you check my availability to book my service ASAP",
    "I can only offer my services when I'm not working and unfortunately that is usually not very often",
    "I am not always available so book a viewing as soon as possible"
  ]
  action = actions.sample

  new_service = Service.new(
    description: "#{wheelp.sample.capitalize} and I can guarantee that I'm a #{character} #{category}",
    bio: "I am a #{vehicle} #{timing.sample} #{category} who #{verbs.sample} #{vehicle_adjective} vehicles.
    #{wheelp.sample.capitalize} and I can guarantee that I'm a #{character} #{category}.
    #{phrase.sample} so #{contact_phrase}",
    address: address,
    price: rand(45..85),
    availability: availability - unavailability,
    title: "#{character} #{vehicle_adjective} #{vehicle} #{category} #{action}",
    user_id: experts.sample
  )

  new_service.save!
  services << new_service.id
  puts "service #{n} created"
end

bookings = []
brands = %w[Audi Ford Volvo BMW VW Scania Mini Toyota Mazda Vauxhall Rolls-Royce Ferrari Porsche Smart Citroen]
models = %w[A5 Corolla M3 Golf Polo Testarossa Xedos Astra Cayenne Supra Spacewagon]
(2..16).each do |n|
  new_booking = Booking.new(
    vehicle_brand: brands.sample,
    vehicle_model: models.sample,
    vehicle_year: rand(1979..2022),
    vehicle_address: addresses.sample,
    vehicle_contact: names.sample,
    vehicle_url: "http://www.soooooomething.com",
    additional_details: "#{n} some very very important details about my booking and preferences",
    date: Date.today + rand(1..20),
    user_id: customers.sample,
    service_id: services.sample
  )
  new_booking.save!
  bookings << new_booking.id
  puts "booking #{n - 1} created"
end
