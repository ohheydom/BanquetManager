require 'faker'

FactoryGirl.define do
  factory :client do |f|
  f.name { Faker::Name.first_name + " " + Faker::Name.last_name }
  end
end
