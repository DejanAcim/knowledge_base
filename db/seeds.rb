skills = ['Ruby', 'Ruby on Rails', 'JavaScript', 'React', 'CSS', 'HTML', 'Ember', 'Git', 'SQL', 'RSpec', 'JQuery', 'VueJS', 'UX/UI', 'React Native', 'Android', 'Swift']
trainings = ['Michael Hartl Ruby on Rails Tutorial',
             'The Complete Ruby on Rails Develper Course',
             'Ruby on Rails 5 - BDD, RSpec and Capybara',
             'Bootstrap 4 From Scratch With 5 Projects',
             'Modern React with Redux',
             'Practical CSS Website Development: Crash Course',
             'Ultimate web',
             'Responsive website template from scratch html css',
             'Web design creating websites from scratch',
             'Javascript arrays',
             'Es6 in depth',
             'MBA business tools that get results free workbooks included',
             'vue web apps',
             'earn vue js introduction to simple reactive javascript',
             'Grid CSS Responsive Website Layout - "Mobile First" Design',
             'JavaScript Fundamentals For Beginners',
             'Learn JavaScript By Building A Bookmarker Application',
             'Simple Weight Converter App With JavaScript & Bootstrap 4',
             'JSON Crash Course',
             'Git & GitHub Crash Course For Beginners']

training_plans = ['JavaScript intermediate course',
                  'Ruby on Rails Testing Plan',
                  'HTML/CSS Basics course',
                  'JavaScript basics',
                  'Ruby on Rails Juniorship plan',
                  'Company fundamentals',
                  'Advanced Ruby course',
                  'Team leadership mastery']

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
