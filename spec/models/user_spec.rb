require 'rails_helper'

include Helpers

RSpec.describe User, type: :model do

  # ..

  describe "favorite beer" do
    let(:user){ FactoryBot.create(:user) }

    it "has method for determining one" do
      expect(user).to respond_to(:favorite_beer)
    end

    it "without ratings does not have one" do
      expect(user.favorite_beer).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = FactoryBot.create(:beer)
      rating = FactoryBot.create(:rating, score: 20, beer: beer, user: user)

      expect(user.favorite_beer).to eq(beer)
    end  
    
    it "is the one with highest rating if several rated" do
      create_beers_with_many_ratings({user: user}, 10, 20, 15, 7, 9)
      best = create_beer_with_rating({ user: user }, 25 )

      expect(user.favorite_beer).to eq(best)
    end    
  end

  describe "with ratings" do
    let(:user) { FactoryBot.create(:user) }

    it "is the only rated if only one rating" do
      beer = FactoryBot.create(:beer)
      rating = FactoryBot.create(:rating, score: 20, beer: beer, user: user)
    
      expect(user.favorite_beer).to eq(beer)
    end

    it "is the one with highest rating if several rated" do
      beer1 = FactoryBot.create(:beer)
      beer2 = FactoryBot.create(:beer)
      beer3 = FactoryBot.create(:beer)
      rating1 = FactoryBot.create(:rating, score: 20, beer: beer1, user: user)
      rating2 = FactoryBot.create(:rating, score: 25, beer: beer2, user: user)
      rating3 = FactoryBot.create(:rating, score: 9, beer: beer3, user: user)
    
      expect(user.favorite_beer).to eq(beer2)
    end
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

  describe "favorite" do
    let(:user){ FactoryBot.create(:user) }
  
    describe "beer" do
      it "has method for determining one" do
        expect(user).to respond_to(:favorite_beer)
      end

      it "without ratings does not have one" do
        expect(user.favorite_beer).to eq(nil)
      end

      it "is the only rated if only one rating" do
        beer = FactoryBot.create(:beer)
        rating = FactoryBot.create(:rating, score: 20, beer: beer, user: user)

        expect(user.favorite_beer).to eq(beer)
      end  
      
      it "is the one with highest rating if several rated" do
        create_beers_with_many_ratings({user: user}, 10, 20, 15, 7, 9)
        best = create_beer_with_rating({ user: user }, 25 )

        expect(user.favorite_beer).to eq(best)
      end 
    end

    describe "style" do
      it "has method for determining one" do
        expect(user).to respond_to(:favorite_style)
      end

      it "without ratings does not have one" do
        expect(user.favorite_style).to eq(nil)
      end

      it "is the style of the only rated if only one rating" do
        create_beer_with_rating({ user: user, style: 'Pale Ale' }, 25)

        expect(user.favorite_style).to eq('Pale Ale')
      end  
      
      it "is the style of with highest average if several rated" do
        create_beers_with_many_ratings({ user: user, style: 'Lager' }, 10, 20, 15, 7, 9)
        create_beers_with_many_ratings({ user: user, style: 'IPA' }, 25, 45 )
        create_beers_with_many_ratings({ user: user, style: 'Alt' }, 50, 10, 8)

        expect(user.favorite_style).to eq('IPA')
      end 
    end 

    describe "brewery" do
      it "has method for determining one" do
        expect(user).to respond_to(:favorite_brewery)
      end

      it "without ratings does not have one" do
        expect(user.favorite_brewery).to eq(nil)
      end

      it "is the style of the only rated if only one rating" do
        favorite = FactoryBot.create(:brewery, name: 'Schlenkerla')
        create_beer_with_rating({ user: user, brewery: favorite }, 25)

        expect(user.favorite_brewery).to eq(favorite)
      end  
      
      it "is the style of with highest average if several rated" do
        favorite = FactoryBot.create(:brewery, name: 'Schlenkerla')
        b1 = FactoryBot.create(:brewery)
        b2 = FactoryBot.create(:brewery)
        create_beers_with_many_ratings({ user: user, brewery: b1 }, 10, 20, 15, 7, 9)
        create_beers_with_many_ratings({ user: user, brewery: favorite }, 25, 45 )
        create_beers_with_many_ratings({ user: user, brewery: b2 }, 50, 10, 8)

        expect(user.favorite_brewery).to eq(favorite)
      end 
    end 
  end  
end