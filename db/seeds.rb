# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# users = User.create([
#                         {name: 'Michael', email: 'michael@app2.com', age: 34, sex: 'M'},
#                         {name: 'Jason', email: 'jason@app2.com', age: 40, sex: 'M'},
#                         {name: 'Dave', email: 'dave@app2.com', age: 33, sex: 'M'},
#                         {name: 'Sarah', email: 'sarah@app2.com', age: 21, sex: 'F'},
#                         {name: 'Michelle', email: 'michelle@app2.com', age: 30, sex: 'F'},
#                         {name: 'Sally', email: 'sally@app2.com', age: 26, sex: 'F'},
#                     ])

events = Event.create!([
                          {name: 'Happy Hour', description: 'For hackers!!', category: 'food', price: 1, location: 'Philz Coffee', latitude: 37.8117863, longitude: --122.4559906, user:6, time: Time.now, been_there: true},
                          {name: 'Bike along the Bay', description: 'Bring your bike and ride with me!!', category: 'outdoors', price: 1, location: 'Hacker Bar', latitude: 37.8117863, longitude: -122.4559906, user: 6, time: Time.now, been_there: true}
                       ])
#
# reviews = Review.create([
#                             {event: events[0], user: users[0], comment: "so much fun!!", stars: 5}
#                         ])
