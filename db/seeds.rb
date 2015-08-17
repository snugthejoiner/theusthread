# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
  user = User.new(
     username: Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end

 50.times do
  historical_event = HistoricalEvent.new(
     description: Faker::Lorem.sentence,
     starting:    Faker::Date.between(36000.days.ago, 30000.days.ago),
     ending:      Faker::Date.between(29000.days.ago, 15000.days.ago)
   )
   historical_event.save!
 end

 10.times do
  historical_event = HistoricalEvent.new(
     description: Faker::Lorem.sentence,
     starting:    Faker::Date.between(36000.days.ago, 30000.days.ago),
     ending:      Faker::Date.between(29000.days.ago, 15000.days.ago),
     premilestone_status:      Faker::Lorem.sentence

   )
   historical_event.save!
 end
 
 10.times do
  historical_event = HistoricalEvent.new(
     description: Faker::Lorem.sentence,
     starting:    Faker::Date.between(36000.days.ago, 30000.days.ago),
     ending:      Faker::Date.between(29000.days.ago, 15000.days.ago),
     ongoing_status:      Faker::Lorem.sentence

   )
   historical_event.save!
 end

  historical_events = HistoricalEvent.all

  tag_names = ["apple","orange","potato"]

  50.times do
    tag = Tag.new(
    name: tag_names.sample,
    historical_event: historical_events.sample
    )
    tag.save!
  end

 puts "Seed finished"