FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    password "password123"
  end
end
