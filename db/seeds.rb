# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

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
avatars = ["https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-46_fzinoe.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-31_stst9t.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-37_eshyvx.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-39_bog5o6.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-28_mcjrcc.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-34_c8dc1w.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-36_cl7sgu.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-25_mhs11m.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-18_wmu4xz.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957172/Artboards_Diversity_Avatars_by_Netguru-23_hlqz6g.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-15_xdgg56.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957173/Artboards_Diversity_Avatars_by_Netguru-19_rpg9ju.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957172/Artboards_Diversity_Avatars_by_Netguru-20_puj0tq.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957172/Artboards_Diversity_Avatars_by_Netguru-01_wpft8a.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957172/Artboards_Diversity_Avatars_by_Netguru-09_uax75s.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957172/Artboards_Diversity_Avatars_by_Netguru-11_zcfbbn.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957172/Artboards_Diversity_Avatars_by_Netguru-05_qrlreh.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957172/Artboards_Diversity_Avatars_by_Netguru-04_yzt8og.png",
  "https://res.cloudinary.com/dhoecmw9w/image/upload/v1646957172/Artboards_Diversity_Avatars_by_Netguru-14_i0y3mv.png"
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

wheelper = User.new(
  username: "alexiwheelper",
  email: "alexi@wheelper.com",
  password: "123456",
  first_name: "Alexi",
  last_name: "Brehovs",
  expert: true
)

alexi_avatar = URI.open("https://avataaars.io/?avatarStyle=Transparent&topType=WinterHat3&accessoriesType=Prescription01&hatColor=Black&facialHairType=BeardLight&facialHairColor=Blonde&clotheType=ShirtCrewNeck&clotheColor=Black&eyeType=Default&eyebrowType=FlatNatural&mouthType=Serious&skinColor=Pale")

wheelper.photo.attach(io: alexi_avatar, filename: 'alexi-avatar.png', content_type: 'image/png')
wheelper.save!
puts "Alexi Wheelper user"

customer = User.new(
  username: "silvithebest",
  email: "silvia@user.com",
  password: "123456",
  first_name: "Silvia",
  last_name: "Gonzalez",
  expert: false
)

silvia_avatar = URI.open("https://avataaars.io/?avatarStyle=Transparent&topType=LongHairStraight&accessoriesType=Blank&hairColor=Brown&facialHairType=Blank&clotheType=ShirtScoopNeck&clotheColor=Pink&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light")

customer.photo.attach(io: silvia_avatar, filename: 'silvia-avatar.png', content_type: 'image/png')
customer.save!
puts "Silvia customer user done"

shady = User.new(
  username: "harleylover",
  email: "harley@angel.com",
  password: "123456",
  first_name: "Stone",
  last_name: "Gonzalez",
  expert: true
)
shady_avatar = URI.open("https://avataaars.io/?avatarStyle=Transparent&topType=Eyepatch&facialHairType=BeardMajestic&facialHairColor=Red&clotheType=Hoodie&clotheColor=Gray02&eyeType=Default&eyebrowType=AngryNatural&mouthType=Smile&skinColor=Yellow")
shady.photo.attach(io: shady_avatar, filename: 'shady-avatar.png', content_type: 'image/png')
shady.save!
puts "Shady user done"

#-------- SERVICES

services = []

character_adjectives = %w[helpful wheelpful sincere serious professional trustworthy knowledgeable passionate thoughtful nice]
vehicles = %w[vehicle car motorbike van four-wheel convertible SUV minivan pickup limousine scooter micro-car familiar]
vehicle_adjectives = %w[vintage automatic luxury easy-to-drive small low-emission electric]
good_adjectives = %w[perfect great amazing high-end awesome exquisite brilliant gorgeous helpful sincere]
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

addresses = %w[London Dublin Paris Berlin Rome Milan Cairo Latvia Bilbao Sevilla Barcelona Bristol Athens Lion Madrid Norway]
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
  category = Service::CATEGORIES.sample
  vehicle = vehicles.sample
  vehicle_adjective = vehicle_adjectives.sample
  address = addresses.sample
  price_adjective = price_adjectives.sample
  actions = [
    "help you find a #{vehicle_adjective} vehicle",
    "help you find the perfect #{vehicle}",
    "check the #{vehicle} for you",
    "verify the condition of any #{vehicle} for you",
    "assist you in your next #{vehicle} purchase",
    "offering a #{price_adjective} priced service",
    "help you to find a #{vehicle} at a #{price_adjectives.sample} price"
  ]
  wheelp = [
    "I love offering my services in Wheelp",
    "I've been a Wheelper for a long time now",
    "I'm new to Wheelp",
    "I discovered Wheelp a couple of months ago",
    "I used Wheelp a couple of years ago as a customer and a few months ago I decided to become a Wheelper",
    "I joined Wheelp some years ago",
    "I'm a reputable long time Wheelper"
  ]

  phrase = [
    "I love offering my services in Wheelp for people in #{address}",
    "I love wheelping people in #{address}",
    "This is a great way of making extra cash and helping people",
    "I take this very seriously",
    "This is a service I actually enjoy doing",
    "This is the perfect way to get involved with #{vehicle} I like while making some extra cash"
  ]

  contact_phrase = [
    "please feel free to get in touch with me",
    "please don't hesitate to ask me any questions",
    "I would love to check the vehicle for you",
    "feel free to ask me any questions regarding your vehicle or my service",
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

availability = []
30.times do |i|
  date = Date.today + i
  availability << date
end

# Alexis Service :
alexis_service = Service.new(
  description: "Hey, I'm scooter stan, I love everything motorised on two wheelps!",
  #looking for a scooter
  bio: "I've been a long time fan of scooters and I love to help others build their love for scooters. When I was a teenager I took apart a Vespa and put it back together in a weekend and I've got an amazing garage filled with tools and spare parts 😊. Let me help you find the motorbike of your dreams! 🛵💨",
  address: "Seville",
  price: 80,
  availability: availability,
  title: "Scooter maniac looking to help someone buy their first scooter!",
  category: "Enthusiast",
  user_id: wheelper.id
)
alexis_service.save!

# Shady Character
shady_service = Service.new(
  description: "I'm an ex Hell's Angels member 🏍, just got out of prison and I'm looking to turn my life around",
  bio: "I've got a huge collection of Harley Davidson's I know everything about motorbikes. After 20 years riding around the world with my gang, the law finally caught up with me. This is a great way for me to pay off my debts while still allowing me to maintain my Rock n' Roll lifestyle 🤟🏼 . All appointments must be approved by my probation officer 🚔",
  address: "Seville",
  price: 180,
  availability: availability,
  category: "Enthusiast",
  user_id: shady.id,
  title: "Former Hell's Angel trying to make some cash, always ready to help!"
)
shady_service.save!





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
  "Excellent service, the wheelper arrived at exactly the time I requested.
  He carried out the job very professionally 👍🏽",
  "Good service, highly recomend! :)",
  "Solid service 💯",
  "He's very knowledgeable, trustworthy, fair, and clear. He has experience in many makes.",
  "I highly recommed this service! Received a very detailed report 👏🏻!",
  "Very efficient wheelper. The wheelper called me immediately and strongly recommended not to buy the car",
  "I know nothing about cars so this service was really helpful to me ☺️. I was able to purchase a car in very good condition ✌🏼",
  "Highly recommended, great work at very reasonable prices. Accommodating and really friendly",
  "Really helpful and also super friendly, 10/10! Thank you 👍🏼",
  "This was such a great service, booking was easy and everything went really well!",
  "Such a great wheelper",
  "I told this wheelper over the chat that I needed a car ASAP to be able to go to my new job. He was kind enough to call me personally so that I didn't have to wait for the evaluation 🤩",
  "Amazing service at a very reasonable price"
]

bad_content = [
  "Horrible service. The Wheelper was late to the booking and the owner of the vehicle sold it by the time the Wheelper arrived.",
  "Never showed up to the viewing. Luckily the guys from Wheelp are very nice and gave me a refund of my money.
  Don't book this wheelper! 👀",
  "Not worth the price, there's cheaper and better Wheelpers out there",
  "The evaluation was not ready",
  "The service was good but this wheelper was rude. Would not recomment",
  "Not the best but the price is decent 🙃",
  "I'm a long time customer from Wheelp since I change my car very often and this was the worst wheelper I've booked so far... it sometimes happens 😣"
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
