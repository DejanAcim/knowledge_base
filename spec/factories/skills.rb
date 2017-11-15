FactoryBot.define do
  factory :skill do |f|
    f.name { Faker::ProgrammingLanguage.unique.name }
  end
end
