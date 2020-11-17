# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
User.destroy_all


puts "Creating users..."
victor = User.create(first_name: 'Victor', last_name: 'Branger', email: 'victor@gmail.com', password: '123456')
elsa = User.create(first_name: 'Elsa', last_name: 'Lebas', email: 'elsa@gmail.com', password: '223456')
pierre = User.create(first_name: 'Pierre', last_name: 'Riedinger', email: 'pierre@gmail.com', password: '323456')
vincent = User.create(first_name: 'Vincent', last_name: 'Huché', email: 'vincent@gmail.com', password: '423456')
mathilde = User.create(first_name: 'Mathilde', last_name: 'Robert', email: 'mathilde@gmail.com', password: '523456')

puts "Creating conveyings..."
marseille_ajaccio = { boat_name:'Titanic', boat_type: 'big', start_location: 'Marseille', arrival_location: 'Ajaccio', start_date: '01/8/2021', arrival_date: '02/08/2021', duration: 2, price: 100, capacity: 2, user_id: victor.id}
ajaccio_marseille = { boat_name:'Titanic', boat_type: 'big', start_location: 'Ajaccio', arrival_location: 'Marseille', start_date: '15/08/2021', arrival_date: '17/08/2021', duration: 2, price: 100, capacity: 2, user_id: elsa.id}
brest_nice = { boat_name:'Black Pearl', boat_type: 'medium', start_location: 'Brest', arrival_location: 'Nice', start_date: '01/07/2021', arrival_date: '20/07/2021', duration: 20, price: 500, capacity: 4, user_id: pierre.id}
nantes_newyork = { boat_name:'Crazy Boat', boat_type: 'medium', start_location: 'Nantes', arrival_location: 'New York', start_date: '01/04/2021', arrival_date: '01/05/2021', duration: 31, price: 1000, capacity: 5, user_id: vincent.id}
cannes_st_tropez = { boat_name:'Zodiac', boat_type: 'small', start_location: 'Cannes', arrival_location: 'St Tropez', start_date: '01/09/2021', arrival_date: '01/09/2021', duration: 1, price: 90, capacity: 1, user_id: mathilde.id}


[ajaccio_marseille, brest_nice, nantes_newyork, cannes_st_tropez].each do |attributes|
  conveying = Conveying.create!(attributes)
  puts "Created #{conveying.boat_name}"
end
puts "Finished!"
