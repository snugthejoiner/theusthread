FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Lorem.word }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
    f.confirmed_at Date.today
  end

end
