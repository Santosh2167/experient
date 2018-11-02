# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

age_ranges = ["0-99","10-20","21-30","31-40","41-50","50+"]
group_ids = []

age_ranges.each do |range|
    group = AgeGroup.create(
        range: range
    )
    group_ids.push group.id
end

categories =["Advanture","Romance","Dining","Cake & Pastry","Film","Opera"]
category_ids =[]
categories.each do |cat|
    category = Category.create(
        category: cat
    )
    category_ids.push category.id
end

30.times do 
    Product.create(
        name: Faker::Appliance.equipment,
        cost: Faker::Number.decimal(3,2),
        description: Faker::Lorem.paragraph(2), 
        active: true,
        # category: Faker::Appliance.brand,
        keywords: "Advanture",
        user_id: 1,
        location: Faker::HarryPotter.location,
        age_group_id: group_ids[rand(group_ids.length)],
        # category_id: 2,
        category_id: category_ids[rand(category_ids.length)]
    )
    
end


   
   
  
