FactoryGirl.define do
  factory :training_plan do |f|
    f.name { Faker::Lorem.sentence }
    f.description { Faker::Lorem.paragraph }
    user
  end
end
