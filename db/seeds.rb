# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do 
    Product.create(
        name: Faker::Appliance.equipment,
        cost: Faker::Number.decimal(3,2),
        description: Faker::Lorem.paragraph(2), 
        active: true,
        category: Faker::Appliance.brand,
        keywords: "Advanture",
        user_id: 1,
        location: Faker::HarryPotter.location
    )
    
end


   
   
  
