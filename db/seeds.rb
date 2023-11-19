# seeds.rb
require 'faker'

# Create Users
10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
end

# Create Movements
10.times do
  Movement.create(author_id: User.pluck(:id).sample, name: Faker::Commerce.product_name, amount: Faker::Number.decimal(l_digits: 2))
end

# Create Groups
20.times do
  Category.create(user_id: User.pluck(:id).sample, movement_id: Movement.pluck(:id).sample, name: Faker::Team.name, icon: Faker::Lorem.word)
end
