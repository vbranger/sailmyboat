# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

victor_photo = URI.open('https://avatars3.githubusercontent.com/u/25443871')
elsa_photo = URI.open('https://avatars1.githubusercontent.com/u/60131956')
pierre_photo = URI.open('https://avatars2.githubusercontent.com/u/69197574')
vincent_photo = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601893596/ixjvt0jojyb1hbrfqhei.jpg')
mathilde_photo = URI.open('https://avatars2.githubusercontent.com/u/36241255')


boat1 = URI.open('https://www.usinenouvelle.com/mediatheque/9/0/1/000720109_image_896x598/image.png')
boat2 = URI.open('https://mathiasmarine.com/pub/media/catalog/category/GT225_2019-1478_590x332.jpg')
boat3 = URI.open('https://www.aprilmarine.fr/sites/default/files/img/smart_page/voilier.jpg')
boat4 = URI.open('https://media.tacdn.com/media/attractions-splice-spp-674x446/09/c7/5d/51.jpg')
boat5 = URI.open('https://upload.wikimedia.org/wikipedia/commons/9/9f/Arp%C3%A8ge_sous_voiles.jpg')


puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
victor = User.create(first_name: 'Victor', last_name: 'Branger', email: 'victor@gmail.com', password: '123456')
elsa = User.create(first_name: 'Elsa', last_name: 'Lebas', email: 'elsa@gmail.com', password: '223456')
pierre = User.create(first_name: 'Pierre', last_name: 'Riedinger', email: 'pierre@gmail.com', password: '323456')
vincent = User.create(first_name: 'Vincent', last_name: 'Huché', email: 'vincent@gmail.com', password: '423456')
mathilde = User.create(first_name: 'Mathilde', last_name: 'Robert', email: 'mathilde@gmail.com', password: '523456')

puts "Adding photos to users"
victor.photo.attach(io: victor_photo, filename: 'victor.jpeg', content_type: 'image/jpeg')
elsa.photo.attach(io: elsa_photo, filename: 'elsa.jpeg', content_type: 'image/jpeg')
pierre.photo.attach(io: pierre_photo, filename: 'pierre.jpeg', content_type: 'image/jpeg')
vincent.photo.attach(io: vincent_photo, filename: 'vincent.jpeg', content_type: 'image/jpeg')
mathilde.photo.attach(io: mathilde_photo, filename: 'mathilde.jpeg', content_type: 'image/jpeg')
puts "Users' photos added"

puts "Creating conveyings..."
marseille_ajaccio = { boat_name:'Titanic', boat_type: 'big', start_location: 'Marseille', arrival_location: 'Ajaccio', start_date: '01/8/2021', arrival_date: '02/08/2021', duration: 2, price: 100, capacity: 2, user_id: victor.id }
ajaccio_marseille = { boat_name:'Bigboat', boat_type: 'big', start_location: 'Ajaccio', arrival_location: 'Marseille', start_date: '15/08/2021', arrival_date: '17/08/2021', duration: 2, price: 100, capacity: 2, user_id: elsa.id }
brest_nice = { boat_name:'Black Pearl', boat_type: 'medium', start_location: 'Brest', arrival_location: 'Nice', start_date: '01/07/2021', arrival_date: '20/07/2021', duration: 20, price: 500, capacity: 4, user_id: pierre.id }
nantes_newyork = { boat_name:'Crazy Boat', boat_type: 'medium', start_location: 'Nantes', arrival_location: 'New York', start_date: '01/04/2021', arrival_date: '01/05/2021', duration: 31, price: 1000, capacity: 5, user_id: vincent.id }
cannes_st_tropez = { boat_name:'Zodiac', boat_type: 'small', start_location: 'Cannes', arrival_location: 'St Tropez', start_date: '01/09/2021', arrival_date: '01/09/2021', duration: 1, price: 90, capacity: 1, user_id: mathilde.id }

[[marseille_ajaccio, boat1], [ajaccio_marseille, boat2], [brest_nice, boat3], [nantes_newyork, boat4], [cannes_st_tropez, boat5]].each_with_index do |attributes, index|
  p "#{index}"
  conveying = Conveying.create!(attributes[0])
  puts "Created #{conveying.boat_name}"
  puts "attaching photo : boat#{index}.png"
  conveying.photos.attach(io: attributes[1], filename: "boat#{index}.png", content_type: 'image/png')
  puts 'photo added'
end

puts "Finished!"
