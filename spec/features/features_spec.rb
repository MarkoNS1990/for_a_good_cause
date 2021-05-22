require 'rails_helper'

feature 'User Sign In' do
    scenario 'Succes Log In' do
      user = User.create!(email:'test@test.com', password: '123456')
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      expect(page).to have_text 'Welcome'
    end

end

  feature 'User Create a new charity' do
    scenario 'Create a new charity' do
      user = User.create!(email: 'test@test.com', password: '123456')
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      click_link 'Create a charity'
      fill_in 'Name', with: 'Testing charity'
      fill_in 'Content', with: 'Testing content'
      click_button 'Create'
      expect(page).to have_text 'Testing charity'
    end
  end
  
  feature 'User makes a donation' do
    scenario 'Make a donation' do
      user = User.create!(email: 'test@test.com', password: '123456')
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      click_link 'Create a charity'
      fill_in 'Name', with: 'Testing charity'
      fill_in 'Content', with: 'Testing content'
      click_button 'Create'
      click_button 'Donate $1'
      expect(page).to have_text 'Thank you for donating to this charity'
    end
  end
  
feature 'Users checks all charity creators' do
    scenario 'See a list of all charity creators' do
      user = User.create!(email:'test@test.com', password: '123456')
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      click_link 'Create a charity'
      fill_in 'Name', with: 'Testing charity'
      fill_in 'Content', with: 'Testing content'
      click_button 'Create'
      visit root_path
      click_link 'All charity creators'
      expect(page).to have_text 'test@test.com'
    end

end