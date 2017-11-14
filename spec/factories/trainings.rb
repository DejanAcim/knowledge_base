FactoryGirl.define do
  factory :training do |f|
    f.name { Faker::Lorem.sentence }
  end
end
