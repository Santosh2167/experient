# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
    first_name: "Blake",
    last_name: "Doyle",
    date_of_birth: "02/11/1993",
    email: "blake@blake",
    password: "password",
    password_confirmation: "password",
    post_code: 2019
)
User.create(
    first_name: "Santosh",
    last_name: "Poudyal",
    date_of_birth: "02/11/1993",
    email: "santosh@santosh",
    password: "password",
    password_confirmation: "password",
    post_code: 2019,
    is_supplier: true
)
User.create(
    first_name: "Tyson",
    last_name: "Hofstetter",
    date_of_birth: "02/11/1993",
    email: "tyson@tyson",
    password: "password",
    password_confirmation: "password",
    post_code: 2019
)
30.times do 
    Product.create(
        name: Faker::Appliance.equipment,
        cost: Faker::Number.decimal(3,2),
        description: Faker::Lorem.paragraph(2), 
        active: true,
        category: Faker::Appliance.brand,
        keywords: "Adventure",
        user_id: 1,
        location: Faker::HarryPotter.location
    )
end



   
   
  
