User.destroy_all
Restaurant.destroy_all
Review.destroy_all
MenuItem.destroy_all
Cuisine.destroy_all

20.times do
  User.create(
    username: Faker::Internet.username,
    password: Faker::Internet.password,
    email:  Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

25.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address:  Faker::Address.street_address,
    phone:  Faker::Number.number(10),
    owner_id: Faker::Number.between(1, 100),
    url: Faker::Internet.url,
    description:  Faker::Restaurant.description,
    onsite_parking: true,
    accepts_reservation: true
  )
end

20.times do
  Cuisine.create(
    name: ["American", "Asian", "BBQ", "Burgers", "Bar", "Chinese", "Fast Food", "French", "German", "Indian", "Italian", "Japanese", "Jamacian", "Korean", "Mexican", "Middle Eastern", "Pizza", "Southern", "Spanish", "Tacos", "Tapas"
    ].sample,
    description:  Faker::Lorem.sentence
  )
end

150.times do
  MenuItem.create(
    restaurant_id: Restaurant.all.sample.id,
    user_id:  User.all.sample.id,
    cuisine_id: Cuisine.all.sample.id,
    name: Faker::Food.dish,
    price:  Faker::Number.within(5..40),
    description:  Faker::Food.description,
    tag:  ["Vegetarian", "Vegan", "Gluten Free", "Includes Meat", "Meat Optional"].sample,
    meal: ["Breakfast", "Lunch", "Dinner"].sample
  )
end

200.times do
  Review.create!(
    user_id:  User.all.sample.id,
    restaurant_id: Restaurant.all.sample.id,
    title:  Faker::Hipster.sentence,
    content:  Faker::Restaurant.review,
    rating: Faker::Number.between(1,5),
    price_range:  ['$', '$$', '$$$', '$$$$'].sample,
    favorite_dish:  MenuItem.all.sample.name
  )
end
