require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new username:"Pekka"

    expect(user.username).to eq("Pekka")
  end

  it "is not saved without a password" do
    user = User.create username:"Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "has not created a password that is less than 4 characters long" do
    user = User.create username:"Pekka", password:"Aaa", password_confirmation:"Aaa"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "has not created a password that consists only of lowercase letters" do
    user = User.create username:"Pekka", password:"abcde", password_confirmation:"abcde"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end
    

describe "with a proper password" do
  let(:user) { FactoryBot.create(:user) }

  it "is saved" do
    expect(user).to be_valid
    expect(User.count).to eq(1)
  end

  it "and with two ratings, has the correct average rating" do
    FactoryBot.create(:rating, score: 10, user: user)
    FactoryBot.create(:rating, score: 20, user: user)

    expect(user.ratings.count).to eq(2)
    expect(user.average_rating).to eq(15.0)
  end
end
end