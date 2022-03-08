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
avatars = ["https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-31_bdc4ch.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-19_yqatkb.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-25_a1qnht.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-20_psh70f.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-18_pov4ir.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-37_cgyi4d.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-09_v3w9s2.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-11_rd9yty.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-34_yi3lgf.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-36_wyj3b7.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-05_tcgblf.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736370/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-23_yb27vm.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736369/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-01_eclrli.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736369/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-14_j7memd.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736369/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-28_dosqpd.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736369/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-15_b4y5wu.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736369/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-39_pb3r6n.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646736369/development/wheelp/avatars/Artboards_Diversity_Avatars_by_Netguru-04_u31y2d.png"
]

#---------USERS
customers = []
experts = []
usernames[0..5].each do |user|
  new_user = User.new(
    username: user,
    email: "#{user[0..4]}@email.com",
    password: "123456",
    first_name: names.sample,
    last_name: surnames.sample,
    expert: true
  )
  file = URI.open(avatars.sample)
  new_user.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
  new_user.save!
  experts << new_user.id
  puts "expert #{user} created"
end

usernames[6..(usernames.length-1)].each do |user|
  new_user = User.new(
    username: user,
    email: "#{user[0..4]}@email.com",
    password: "123456",
    first_name: names.sample,
    last_name: surnames.sample,
    expert: false
  )
  file = URI.open(avatars.sample)
  new_user.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
  new_user.save!
  customers << new_user.id
  puts "customer #{user} created"
end

#-------- SERVICES

services = []

character_adjectives = %w[helpful wheelpful sincere serious professional truthworthy knowledgeable passionate thoughtful nice]
vehicles = %w[vehicle car motorbike van four-wheel convertible SUV minivan pickup limousine scooter micro-car familiar]
vehicle_adjectives = %w[vintage automatic luxury easy-to-drive small low-emission electric]
good_adjectives = %w[perfect great amazing high-end awesome exquisite brilliant gorgeous helpful sincere]
CATEGORIES = ["Enthusiast", "Mechanic", "Technician", "Brand Expert"]
price_adjectives = %w[affordable reasonable inexpensive reduced discounted modest moderate]
verbs = [
  "love",
  "enjoy",
  "work with",
  "own #{rand(1..4)}",
  "like"
]
timing = [
  "long time",
  "amateur",
  "new",
  ""
]

addresses = %w[London Dublin Paris Berlin Rome Milan Kairo Latvia Bilbao Sevilla Barcelona Bristol Athens Lion Madrid Norway]
availability = []
30.times do |i|
  date = Date.today + i
  availability << date
end
experts.each do |expert_id|
  unavailability = []
  availability.count.times do |i|
    action = [true, false]
    if action.sample
      date = Date.today + i
      unavailability << date
    end
  end
  character = character_adjectives.sample
  category = CATEGORIES.sample
  vehicle = vehicles.sample
  vehicle_adjective = vehicle_adjectives.sample
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

  other = [
    "I really think",
    "my friends say that",
    "I'd like to think that",
    "I can guarantee that",
    "you won't regret buying my service as",
    "you can be sure that",
    "my clients say",
    "some people say that",
    "I can say",
    "I think I can say"
  ]
  action = actions.sample

  new_service = Service.new(
    description: "I'm #{character} and I #{verbs.sample} #{vehicle_adjective} #{vehicle}s.",
    category: category,
    bio: "I am a #{timing.sample} #{vehicle} #{category} who #{verbs.sample} #{vehicle_adjective} vehicles.
    #{wheelp.sample.capitalize} and #{other.sample}t I'm a #{character} #{category}.
    #{phrase.sample} so #{contact_phrase.sample}",
    address: address,
    price: rand(45..85),
    availability: availability - unavailability,
    title: "#{character} #{vehicle_adjective} #{vehicle} #{category} #{action}",
    user_id: expert_id
  )
  new_service.save!
  services << new_service.id
  puts "service #{expert_id} created"
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
  "Solid service 💯",
  "Hes very knowledgeable, trustworthy, fair, and clear. He has experience in many makes.",
  "I highly recommed this service! Received a very detailed report 👏🏻!",
  "Very efficient wheelper. The wheelper called me immediately and strongly recommended not to buy the car",
  "I know nothing about cars so this service was really helpful to me ☺️. I was able to purchase a car in very goog condition ✌🏼",
  "Highly recommended, great work at very reasonable prices. Accommodating and really friendly",
  "Really helful and also super friendly 10/10! Thank you 👍🏼",
  "This was such a great service, booking was easy and everything went really well!",
  "Such a great wheelper",
  "I told this wheelper over the chat that I needed a car ASAP to be able to go to my new job, he was kind enough to call me personally so that I didn't have to wait for the evaluation 🤩",
  "Amazing service at a very reasonable price"
]

bad_content = [
  "Horrible service, was late to the booking and the owner of the vehicle sold it by the time the wheelper arrived.",
  "Never showed up to the viewing. Luckily the guys from Wheelp are very nice and gave me a refund of my money.
  Don't book this wheelper! 👀",
  "Not worth the price, there's cheaper and better whelpers out there",
  "The evaluation was ready ",
  "The service was good but this wheelper was rude. Would not recomment",
  "Not the best but the price is decent 🙃",
  "I'm a long time user from Wheelp since I change my car very often and this was the worst wheelper I've booked so far.... sometimes happens 😣"
]
bookings.each do |n|
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
  puts "review #{n} created"
end
