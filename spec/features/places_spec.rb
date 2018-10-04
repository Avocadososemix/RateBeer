require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "if no venues are found, inform the user of this with a message" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
    []
    )
    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_no_content "Oljenkorsi"
    expect(page).to have_content "No locations in kumpula"
  end

  it "if many are returned by the API, they are all showed on the page" do
    allow(BeermappingApi).to receive(:places_in).with("espoo").and_return(
      BeermappingApi.places_in("espoo")
      )


    #  [ Place.new( name:"nakkibaari", id: 1 ),  ]
    #  [ Place.new( name:"makkarabaari", id: 2 ) ]
    #  [ Place.new( name:"kettubaari", id: 3 ) ]

      visit places_path
      fill_in('city', with: 'espoo')
      click_button "Search"

      expect(page).to have_content "Gallows Bird"
    #  expect(page).to have_content "makkarabaari"
    # expect(page).to have_content "kettubaari"
  end
end