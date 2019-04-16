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

20.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address:  Faker::Address.street_address,
    phone:  Faker::PhoneNumber.phone_number,
    owner_id: Faker::Number.between(1, 10),
    url: Faker::Internet.url,
    description:  Faker::Restaurant.description,
    onsite_parking: true,
    accepts_reservation: true
  )
end

15.times do
  Cuisine.create(
    name: Faker::Restaurant.type,
    description:  Faker::Lorem.sentence
  )
end

30.times do
  Review.create!(
    user_id:  User.all.sample.id,
    restaurant_id: Restaurant.all.sample.id,
    title:  Faker::Hipster.sentence,
    content:  Faker::Hipster.paragraph,
    rating: Faker::Number.between(1,5),
    price_range:  Faker::Hipster.word,
    favorite_dish:  Faker::Hipster.word
  )
end

30.times do
  MenuItem.create(
    restaurant_id: Restaurant.all.sample.id,
    user_id:  User.all.sample.id,
    cuisine_id: Cuisine.all.sample.id,
    name: Faker::Hipster.words(2),
    price:  Faker::Number.decimal(2, 2),
    description:  Faker::Hipster.sentence
  )
end
