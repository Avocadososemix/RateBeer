require 'rails_helper'

include Helpers

describe "Beers page" do
  let!(:brewery) { FactoryBot.create :brewery, name:"Koff" }

  before :each do
    FactoryBot.create :user
    sign_in(username: "Pekka", password: "Foobar1")
  end

  it "can add a new beer to a brewery" do
    visit beers_path
    expect(page).to have_content 'Beers'
    click_link "New Beer"

    fill_in('beer[name]', with:'Hupikalja')
    select('Koff', from:'beer[brewery_id]')
    select('Weizen', from:'beer[style]')

    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)
  end

  it "shows error message if beer name is not correct" do
    visit beers_path
    click_link "New Beer"

    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.by(0)
    expect(page).to have_content 'Name can\'t be blank'
  end
end
