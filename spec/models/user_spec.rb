require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: '123456')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'john@example.com')
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(name: 'John Doe')
    expect(user).to_not be_valid
  end

  it 'has many movements' do
    user = User.reflect_on_association(:movements)
    expect(user.macro).to eq(:has_many)
  end

  it 'requires a unique icon' do
    User.create(name: 'Existing User', email: 'existing@example.com')
    new_user = User.new(name: 'New User', email: 'existing@example.com')
    expect(new_user).to_not be_valid
  end

  it 'password must have at least 6 characters' do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: '12345')
    expect(user).to_not be_valid
  end
end
