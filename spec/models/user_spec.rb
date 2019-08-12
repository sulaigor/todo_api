require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without attributes" do
    expect(User.new).to_not be_valid
  end

  it "is not valid without name" do
    user = User.new(email: 'email@email.com')
    expect(user).to_not be_valid
  end

  it "is not valid without email" do
    user = User.new(name: 'name')
    expect(user).to_not be_valid
  end

  it "is valid with name and email" do
    user = User.new(name: 'name', email: 'email@email.com')
    expect(user).to be_valid
  end

  it "is not valid with same email" do
    email = 'email@email.com'
    first_user = User.create!(name: 'name', email: email)
    second_user = User.new( name: 'name', email: email)
    expect(first_user).to be_valid
    expect(second_user).to_not be_valid
  end

  it "is not valid with same access token" do
    access_token = '123456789'
    first_user = User.create!(name: 'name', email: 'email@email.com')
    first_user.access_token = access_token
    first_user.save!
    second_user = User.new( name: 'name', email: 'email2@email.com', access_token: access_token)
    expect(first_user).to be_valid
    expect(second_user).to_not be_valid
  end

end
