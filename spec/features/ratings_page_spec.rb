require 'rails_helper'

include Helpers

describe "Rating" do
  let!(:brewery) { FactoryBot.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryBot.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryBot.create :beer, name:"Karhu", brewery:brewery }
  let!(:beer3) { FactoryBot.create :beer, name:"JuhlaOlut", brewery:brewery }
  let!(:user) { FactoryBot.create :user }
  let!(:user2) { FactoryBot.create :user2 }
  let!(:rating1) { FactoryBot.create :rating, beer:beer1, user:user, score:"12" }
  let!(:rating2) { FactoryBot.create :rating, beer:beer2, user:user, score:"15" }
  let!(:rating3) { FactoryBot.create :rating, beer:beer2, user:user, score:"18" }
  let!(:rating4) { FactoryBot.create :rating, beer:beer2, user:user2, score:"13" }
  let!(:rating5) { FactoryBot.create :rating, beer:beer3, user:user2, score:"14" }

  before :each do
    sign_in(username: "Pekka", password: "Foobar1")
  end

  it "when given, is registered to the beer and user who is signed in" do
    visit new_rating_path
    select('iso 3', from:'rating[beer_id]')
    fill_in('rating[score]', with:'15')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(5).to(6)

    expect(user.ratings.count).to eq(4)
    expect(beer1.ratings.count).to eq(2)
    expect(beer1.average_rating).to eq(13.5)
  end

  it "tells the current amount of ratings displayed" do
    visit ratings_path
    expect(page).to have_content 'Ratings given: 5'
  end

  it "only given by the user can be seen on the user's profile" do
    visit user_path(user)
    expect(page).to have_content 'Has made 3 ratings'
    expect(page).to have_no_content 'JuhlaOlut'
    visit user_path(user2)
    expect(page).to have_content 'Has made 2 ratings'
    expect(page).to have_content 'JuhlaOlut'
  end

  it "can be removed using the delete key" do
    visit user_path(user)
    expect(user.ratings.count).to eq(3)
    expect{
        page.find('li', text: 'iso 3').click_link('delete')
      }.to change{user.ratings.count}.from(3).to(2)
  end
end