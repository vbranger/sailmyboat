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


boat1 = [URI.open('https://www.usinenouvelle.com/mediatheque/9/0/1/000720109_image_896x598/image.png')]
boat2 = [URI.open('https://mathiasmarine.com/pub/media/catalog/category/GT225_2019-1478_590x332.jpg')]
boat3 = [URI.open('https://www.aprilmarine.fr/sites/default/files/img/smart_page/voilier.jpg')]
boat4 = [URI.open('https://media.tacdn.com/media/attractions-splice-spp-674x446/09/c7/5d/51.jpg')]
boat5 = [URI.open('https://upload.wikimedia.org/wikipedia/commons/9/9f/Arp%C3%A8ge_sous_voiles.jpg')]
boat6 = [URI.open('https://www.finn-france.ovh/images/com_adsmanager/contents/croiseur-rapide-10m_438_3.jpg'), URI.open('https://www.finn-france.ovh/images/com_adsmanager/contents/croiseur-rapide-10m_438_2.jpg'), URI.open('https://www.finn-france.ovh/images/com_adsmanager/contents/croiseur-rapide-10m_438_1.jpg'), URI.open('https://www.finn-france.ovh/images/com_adsmanager/contents/croiseur-rapide-10m_438_5.jpg')]

puts "Cleaning database..."
Booking.destroy_all
User.destroy_all

puts "Creating users..."
victor = User.create(first_name: 'Victor', last_name: 'Branger', email: 'victor@gmail.com', password: '123456', rating: 4.6)
elsa = User.create(first_name: 'Elsa', last_name: 'Lebas', email: 'elsa@gmail.com', password: '223456', rating: 4.8)
pierre = User.create(first_name: 'Pierre', last_name: 'Riedinger', email: 'pierre@gmail.com', password: '123456', rating: 4.1)
vincent = User.create(first_name: 'Vincent', last_name: 'Huché', email: 'vincent@gmail.com', password: '423456', rating: 4.3)
mathilde = User.create(first_name: 'Mathilde', last_name: 'Robert', email: 'mathilde@gmail.com', password: '523456', rating: 4.5)

puts "Adding photos to users"
victor.photo.attach(io: victor_photo, filename: 'victor.jpeg', content_type: 'image/jpeg')
elsa.photo.attach(io: elsa_photo, filename: 'elsa.jpeg', content_type: 'image/jpeg')
pierre.photo.attach(io: pierre_photo, filename: 'pierre.jpeg', content_type: 'image/jpeg')
vincent.photo.attach(io: vincent_photo, filename: 'vincent.jpeg', content_type: 'image/jpeg')
mathilde.photo.attach(io: mathilde_photo, filename: 'mathilde.jpeg', content_type: 'image/jpeg')
puts "Users' photos added"

puts "Creating conveyings..."
marseille_ajaccio = { boat_name:'Titanic', boat_type: 'Yacht', start_location: 'Marseille', arrival_location: 'Ajaccio', start_date: '01/8/2017', arrival_date: '20/08/2018', price: 100, capacity: '2', user_id: victor.id, booked: true }
ajaccio_marseille = { boat_name:'Bigboat', boat_type: 'Motorboat', start_location: 'Ajaccio', arrival_location: 'Marseille', start_date: '15/08/2019', arrival_date: '17/08/2019', price: 100, capacity: '2', user_id: victor.id }
brest_nice = { boat_name:'Black Pearl', boat_type: 'Motorboat', start_location: 'Brest', arrival_location: 'Nice', start_date: '01/07/2021', arrival_date: '20/07/2021', price: 500, capacity: '4', user_id: victor.id }
nantes_newyork = { boat_name:'Crazy Boat', boat_type: 'Sailboat', start_location: 'Saint-Nazaire', arrival_location: 'New York', start_date: '01/04/2021', arrival_date: '01/05/2021', price: 1000, capacity: '5', user_id: victor.id, booked: true }
cannes_st_tropez = { boat_name:'Zodiac', boat_type: 'Sailboat', start_location: 'Cannes', arrival_location: 'St Tropez', start_date: '01/09/2021', arrival_date: '30/09/2021', price: 90, capacity: 1, user_id: victor.id }
dunkerque_la_corogne = { boat_name:'Adonis', boat_type: 'Sailboat', start_location: 'Dunkerque', arrival_location: 'La Corogne', start_date: '01/07/2020', arrival_date: '20/12/2020', price: 800, capacity: '1', user_id: victor.id }

bookings1 = [{ user_id: elsa.id, start_time: '15/09/2018', end_time: '19/08/2018'}]
bookings2 = [{ user_id: pierre.id, start_time: '15/04/2021', end_time: '20/04/2021'}]
bookings3 = [{ user_id: mathilde.id, start_time: '15/09/2021', end_time: '19/09/2021'}, { user_id: pierre.id, start_time: '10/09/2021', end_time: '21/09/2021'}]

[[marseille_ajaccio, boat1, bookings1], [ajaccio_marseille, boat2], [brest_nice, boat3], [nantes_newyork, boat4, bookings2], [cannes_st_tropez, boat5, bookings3], [dunkerque_la_corogne, boat6]].each_with_index do |attributes, index|
  p "#{index}"
  conveying = Conveying.create!(attributes[0])
  puts "Created #{conveying.boat_name}"
  index_photo = 0
  attributes[1].each do |photo|
    puts "attaching photo : boat#{index}-#{index_photo}.png"
    conveying.photos.attach(io: photo, filename: "boat#{index}-#{index_photo}.png", content_type: 'image/png')
    puts 'photo added'
    index_photo += 1
  end
  unless attributes[2].nil?
    puts "Creating bookings for #{conveying.boat_name}"
    attributes[2].each do |booking|
      booking[:conveying_id] = conveying.id
      Booking.create!(booking)
      puts "booking created"
    end
  end
  puts "all bookings created for #{conveying.boat_name}"
end

puts "Finished!"