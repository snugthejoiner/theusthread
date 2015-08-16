FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Lorem.word }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
  end

end
