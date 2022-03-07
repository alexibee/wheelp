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
  "https://www.liveabout.com/thmb/oR_kgnRY47YAD6N5TRlpEYJTCtw=/2064x1161/smart/filters:no_upscale()/GettyImages-522272311-5949bdc15f9b58d58a035319.jpg",
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
  "owns #{rand(1..4)}",
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
(1..10).each do |n|
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
    "helps you finding a #{vehicle} at a #{price_adjectives.sample} price"
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
    description: "I'm a #{timing.sample} #{category} #{character} who #{verbs.sample} #{vehicle_adjective} #{vehicle}s.",
    bio: "I am a #{vehicle} #{timing.sample} #{category} who #{verbs.sample} #{vehicle_adjective} vehicles.
    #{wheelp.sample.capitalize} and I can guarantee that I'm a #{character} #{category}.
    #{phrase.sample} so #{contact_phrase.sample}",
    address: address,
    price: rand(45..85),
    availability: availability - unavailability,
    title: "#{character} #{vehicle_adjective} #{vehicle} #{category} #{action}",
    user_id: experts.sample
  )
  file = URI.open(experts_photos.sample)
  new_service.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
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
  bookings << new_booking
  puts "booking #{n - 1} created"
end


#----REVIEWS

reviews = []
good_content = [
  "Excellent service, the wheelper arrived at exactly the time given.. to the minute.
  He carried out the job very professionally 👍🏽",
  "Good service, would recomend! :)",
  "Solid service. 💯"
  ". Hes very knowledgeable, trustworthy, fair, and clear. He has experience in many makes.",
  "I highly recommed this service! Received a very detailed report 👏🏻!",
  "Very efficient wheelper. The wheelper called me immediately and strongly recommended not to buy the car, I needed a ser",
  "I know nothing about cars so this service was really helpful to me ☺️. I was able to purchase a car in very goog condition ✌🏼",
  "Highly recommended, great work at very reasonable prices. Accommodating and really friendly.",
  "Really helful and also super friendly 10/10! Thank you 👍🏼"
]

bad_content = [
  "Horrible service, was late to the booking and the owner of the vehicle sold it by the time the wheelper arrived.",
  "Never showed up to the viewing. Luckily the guys from Wheelp are very nice and gave me a refund of my money.
  Don't book this wheelper! 👀",
  "The service was good but this wheelper was rude. Would not recomment",
  "Not the best but the price is decent 🙃",
  "I'm a long time user from Wheelp since I change my car very often and this was the worst wheelper I've booked so far.... sometimes happens 😣",
]
(3..20).each do |n|
  type = [good_content, bad_content].sample
  if type == good_content
    rating = rand(4..5)
  else
    rating = rand (1..3)
  end

  booking = bookings.sample

  new_review = Review.new(
    content: type.sample,
    rating: rating,
    booking_id: booking.id,
    user_id: booking.user_id
    )
  new_review.save!
  reviews << new_review.id
  puts "review #{n - 1} created"
end
