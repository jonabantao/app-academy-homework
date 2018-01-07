# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all
Album.destroy_all


# User
fred = User.create!(email: 'fred@metal.com', password: 'starwars')
daniel = User.create!(email: 'daniel@classical.com', password: 'starwars')

# Band
little_as = Band.create!(name: 'the little \'a\'s')
big_as = Band.create!(name: 'THE BIG \'A\'s')

# Album
gonna  = Album.create!(title: 'Gonna be a big A someday!', band: little_as, year: 2017)
