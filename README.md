# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

YELP API ACCESS
Client ID
_x4fZVfi3sYDTpvme8cA9A

API Key
EP0EsnA8VobWO0C4DnHKCXguPqjNx2UwsgbyxXxKiGd30SzryE7hDKTt3vMj7g5vCrPrAhGXRZg1GFmCEz56Lzp8qGN5EMkRxGhGzi5h0CHLR1ifxiI9ObiBzIy0XHYx

PLANNING

structure for Veg-Out

Models
User
Review
Restaurant	
Menu
cuisine
*profile

Tables
User:
username
password
first_name
last_name

Review:
user_id
restaurant_id
content
favorite_dish
type_of_cuisine
type_of_diet
rating

Restaurant:
name
address
slogan
cuisine_id

Menu:
restaurant_id
dishes

Cuisine:
type

Questions
should we include meals available ie breakfast, lunch, dinner, late night
should we include a price range, if so represent in $$$
user profiles?
likes on reviews


Custom Methods
highest rated
most ratings (restaurant)
most liked reviews
user with most reviews
users most liked reviews
restaurant most liked reviews

Queries
search by cuisine
search by reviews
by ratings
user by reviews
