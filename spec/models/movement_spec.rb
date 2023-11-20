require 'rails_helper'

RSpec.describe Movement, type: :model do
  it 'is valid with valid attributes' do
    user = User.create!(name: 'John Doe', email: 'johndoe@example.com', password: '123456')
    category = Category.new(user:, name: 'Microverse', icon: 'icon.jpg')
    movement = Movement.new(author_id: user.id, name: 'T-shirt', amount: 20.50)
    category.movements << movement
    expect(movement).to be_valid
  end

  it 'is not valid without a user' do
    movement = Movement.new(name: 'T-shirt', amount: 'icon.jpg')
    expect(movement).to_not be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: 'John Doe', email: 'johndoe@example.com', password: '123456')
    category = Category.new(user:, name: 'Microverse', icon: 'icon.jpg')
    movement = Movement.new(author_id: user.id, amount: 'icon.jpg')
    category.movements << movement
    expect(movement).to_not be_valid
  end

  it 'has and belongs to many movements ' do
    movement = Movement.reflect_on_association(:categories)
    expect(movement.macro).to eq(:has_and_belongs_to_many)
  end

  it 'has and belongs to a user' do
    movement = Movement.reflect_on_association(:user)
    expect(movement.macro).to eq(:belongs_to)
  end
end
