# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

 1.times do
  user = User.new(
     username: 'snug',
     email:    'jedpmail@gmail.com',
     password: 'qwertyuiop'
   )
   user.skip_confirmation!
   user.save!
 end

  tag_names = ["apple","orange","potato"]

 puts "Seed finished"