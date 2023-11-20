require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John Doe', email: 'johndoe@example.com', password: '123456')
    category = Category.new(user:, name: 'Microverse', icon: 'icon.jpg')
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(icon: 'icon.jpg')
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(icon: 'icon.jpg')
    expect(category).to_not be_valid
  end

  it 'has and belongs to many movements ' do
    category = Category.reflect_on_association(:movements)
    expect(category.macro).to eq(:has_and_belongs_to_many)
  end

  it 'requires a unique name' do
    Category.create(name: 'Existing Category', icon: 'icon.jpg')
    new_category = Category.create(name: 'New Category', icon: 'icon.jpg')
    expect(new_category).to_not be_valid
  end

  it 'has and belongs to a user ' do
    category = Category.reflect_on_association(:user)
    expect(category.macro).to eq(:belongs_to)
  end
end
