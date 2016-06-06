FactoryGirl.define do
  factory :goal do
    user_id 1
    title { Faker::Hipster.sentence}
    association :user, factory: :user  
  end
end
