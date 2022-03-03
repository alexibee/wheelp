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


services = []
adjectives = %w[perfect great amazing awesome exquisite brilliant gorgeous]
nouns = %w[expert mechanic service]
address = %w[London Paris Berlin Milan Kairo Greece Latvia Spain Norway]
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
  new_service = Service.new(
    bio: "I am a great expert and you will be amazed by how great my services are.",
    address: address.sample,
    price: rand(45..85),
    availability: availability - unavailability,
    title: "#{adjectives.sample} #{nouns.sample} to help you find the car of your dreams",
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
    vehicle_address: address.sample,
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
