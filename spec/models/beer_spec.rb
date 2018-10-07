require 'rails_helper'

RSpec.describe Beer, type: :model do

  it "is not generated without style" do
    test_brewery = Brewery.new name: "test", year: 2000
    beer = Beer.create name:"Iso 3", brewery:test_brewery

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
    
  end

  it "is not generated without name" do
    test_brewery = Brewery.new name: "test", year: 2000
    beer = Beer.create style_id: 1, brewery:test_brewery

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  describe "with a user and brewery" do
    let(:user){ User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1" }
    let(:test_brewery) { Brewery.new name: "test", year: 2000 }
    let(:test_style) { Style.create name: "Lager", description: "lager is tasty" }
    let(:test_beer) { Beer.create name: "testbeer", style: test_style, brewery: test_brewery }


    it "is saved" do
      expect(test_beer).to be_valid
      expect(Beer.count).to eq(1)
    end

  end
end
