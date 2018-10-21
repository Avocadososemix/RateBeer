Rails.application.routes.draw do
  resources :styles
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  resources :places, only: [:index, :show]
# mikä generoi samat polut kuin seuraavat kaksi
# get 'places', to:'places#index'
# get 'places/:id', to:'places#show'
  resource :session, only: [:new, :create, :destroy]
  resources :ratings, only: [:index, :new, :create, :destroy]

  resources :breweries do
    post 'toggle_activity', on: :member
  end
  resources :users do
    post 'toggle_closed', on: :member
  end

root 'breweries#index'
get 'kaikki_bisset', to: 'beers#index'
get 'signup', to: 'users#new'
get 'signin', to: 'sessions#new'
get 'places', to: 'places#index'
get 'beerlist', to:'beers#list'
get 'brewerylist', to:'breweries#list'
post 'places', to:'places#search'

delete 'signout', to: 'sessions#destroy'
#get 'ratings', to: 'ratings#index'
#get 'ratings/new', to:'ratings#new'
#post 'ratings', to: 'ratings#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
