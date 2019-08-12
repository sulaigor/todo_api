require 'rails_helper'

RSpec.describe Todo, type: :model do

   it "is not valid without attributes" do
     expect(Todo.new).to_not be_valid
   end

  it "is not valid without owner" do
    todo = Todo.new(text: "text")
    expect(todo).to_not be_valid
  end

  it "is not valid without text" do
    todo = Todo.new(user_id: 1)
    expect(todo).to_not be_valid
  end

  it "is valid with text and owner" do
    User.create!(id: 1, name: 'name', email: 'email@email.com')
    todo = Todo.new(text: 'text', user_id: 1)
    expect(todo).to be_valid
  end

end
