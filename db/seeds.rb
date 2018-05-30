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
        remote_important_photo_url: "https://picsum.photos/1500/1750/?random",
        user: users.sample
    )
end

##############################################################



puts "#{User.all.count} Users Added"
puts "#{ImportantPhoto.all.count} Important Photos Added"
