skills = ['Ruby', 'Ruby on Rails', 'JavaScript', 'React', 'CSS', 'HTML', 'Ember', 'Git', 'SQL', 'RSpec', 'JQuery', 'VueJS', 'UX/UI', 'React Native', 'Android', 'Swift']
trainings = ['Michael Hartl Ruby on Rails Tutorial',
             '[Udemy] The Complete Ruby on Rails Develper Course',
             '[Udemy] Ruby on Rails 5 - BDD, RSpec and Capybara',
             '[Udemy] Bootstrap 4 From Scratch With 5 Projects',
             '[Udemy] Modern React with Redux',
             '[Udemy] Practical CSS Website Development: Crash Course']

training_plans = ['JavaScript intermediate course',
                  'Ruby on Rails Testing Plan',
                  'HTML/CSS Basics course',
                  'JavaScript basics',
                  'Ruby on Rails Juniorship plan']

admin = User.create(email: 'admin@example.com',
                    name: 'Admin',
                    surname: 'Admin',
                    password: 'password',
                    admin: true )

6.times do
  FactoryBot.create(:user)
end

skills.each do |skill|
  Skill.find_or_create_by(name: skill)
end

trainings.each do |training|
  Training.find_or_create_by(name: training)
end

training_plans.each do |plan|
  tp = TrainingPlan.find_or_create_by( name: plan )
  tp.update_attributes(description: Faker::Lorem.paragraph, user_id: User.all.ids.sample )
  rand(6).times do
    tp.skills << Skill.all.sample
  end
  rand(6).times do
    tp.trainings << Training.all.sample
  end
  print '.'
end

puts 'Seeding fininshed.'
