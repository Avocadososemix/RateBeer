# README

This is a feature-rich **beer-rating web application**. The app allows users to sign up and rate beers. Users may create and add new beers, breweries and beer styles to the application database, which can then be browsed and rated by other users. Users may also form beer clubs, and choose to join the beer clubs of other users. Another notable feature is users can search for cities, and the users can find establishments in the searched cities that sell beer. 

Heroku:
[Heroku](https://shrouded-stream-47285.herokuapp.com/)

Travis:
[![Build Status](https://travis-ci.org/Avocadososemix/RateBeer.svg?branch=master)](https://travis-ci.org/Avocadososemix/RateBeer)

CodeClimate:
[![Maintainability](https://api.codeclimate.com/v1/badges/d928663b561b531693b7/maintainability)](https://codeclimate.com/github/Avocadososemix/RateBeer/maintainability)

---

## How to Start Up

This project can be ran locally, as long as Rails has been installed, and API-keys for the *BeerMappingAPI* and *WeatherMapAPI* are changed for your instance of the program (added to the env/bashrc).  

Connecting to `http://localhost:3000/` will show the index-page when ran locally.  

If used online, these same APIkeys must be configured to be available to the host of your RateBeer-application.  

Admins must be added to the system through the database, or another admin can promote another user to the status of admin.

## Technical Information


* Ruby version: ruby 2.5.1p57 (2018-03-29 revision 63029) (x86_64-linux)

* Rails version: 5.2.1

* This project has been built and tested on ubuntu 16.04.

* Databases use *PostGreSQL*, and can be seeded from the seed in the DB folder.

* The project can be tested locally using the command `rspec spec` in a terminal that is open in the project root.

* Services (job queues, cache servers, search engines, etc.)

* To deploy the RateBeer-application, it must be pushed to Heroku or another hosting platform.

