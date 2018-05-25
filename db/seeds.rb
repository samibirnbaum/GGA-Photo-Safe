# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

##########################################################
#User Creation
4.times do
    User.create!( 
        email: Faker::Internet.unique.free_email,
        password: "password"
    )
end

User.create!(email: "samibirnbaum1@gmail.com", password: "password")

users = User.all

##########################################################


#Important Photo Creation
20.times do
    ImportantPhoto.create!(
        title: Faker::Job.field,
        description: Faker::HarryPotter.quote,
        user: users.sample
    )
end

##############################################################



puts "#{User.all.count} Users Added"
puts "#{ImportantPhoto.all.count} Important Photos Added"