# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Tag.create([{name: 'News', slug: 'news'}, {name: 'Image', slug: 'image'},{name: 'Ruby', slug: 'ruby'}])
    Tag.create([{name: 'Person', slug: 'person'}, {name: 'Text', slug: 'text'},{name: 'Star', slug: 'star'}])
    Tag.create([{name: 'Doge', slug: 'doge'}, {name: 'Wut', slug: 'wut'},{name: 'Interests', slug: 'interests'}])
    Tag.create([{name: 'Longest tag ever created noone knows why', slug: 'longest_tag'}])