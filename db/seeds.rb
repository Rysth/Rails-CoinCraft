# db/seeds.rb

require 'faker'

# Create 5 users
5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# Create 10 movements
10.times do
  Movement.create!(
    name: Faker::Commerce.product_name,
    amount: Faker::Commerce.price(range: 0..100.0),
    author_id: User.pluck(:id).sample
  )
end

# Create 5 categories
5.times do
  Category.create!(
    name: Faker::Commerce.department,
    icon: Faker::Lorem.word,
    user_id: User.pluck(:id).sample
  )
end
