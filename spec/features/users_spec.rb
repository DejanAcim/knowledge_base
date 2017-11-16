require 'rails_helper'

RSpec.feature "Users", type: :feature do
   context 'create new user' do
     before(:each) do
       visit register_path
       within('form') do
         fill_in 'Name', with: 'Jan'
         fill_in 'Surname', with: 'Kowalski'
         fill_in 'Password', with: 'password'
       end
     end

     scenario 'should be successful' do
       within('form') do
         fill_in 'Email', with: 'jan@example.com'
       end
       click_button 'Register'
       expect(page).to have_content('Your account has been created successfully')
     end

     scenario 'should fail' do
       click_button 'Register'
       expect(page).to have_content("Email can't be blank")
     end
   end

   context 'update user' do
     let!(:user) { User.create(name: 'Jan', surname: 'Kowalski', email: 'jan@example.com', password: 'password') }
     before(:each) do
       visit "/"
       click_link "Log in"
       fill_in "Email", with: user.email
       fill_in "Password", with: user.password
       click_button "Log in"

       visit edit_user_path(user)
     end

     scenario 'should be successful' do
       within('form') do
         fill_in 'Name', with: 'Janusz'
         fill_in 'Email', with: 'janusz@example.com'
       end
       click_button 'Edit profile'
       expect(page).to have_content('Your profile has been updated successfully')
     end

     scenario 'should fail' do
       within('form') do
         fill_in 'Name', with: ''
       end
       click_button 'Edit profile'
       expect(page).to have_content("Name can't be blank")
     end
   end

   context 'view profile' do
     let!(:user) { User.create(name: 'Jan', surname: 'Kowalski', email: 'jan@example.com', password: 'password') }
       before(:each) do
         visit "/"
         click_link "Log in"
         fill_in "Email", with: user.email
         fill_in "Password", with: user.password
         click_button "Log in"

         visit edit_user_path(user)
       end

     scenario 'should be successful' do
       click_link "View Profile"
       expect(page).to have_content('User: Jan Kowalski')
     end
   end
end
