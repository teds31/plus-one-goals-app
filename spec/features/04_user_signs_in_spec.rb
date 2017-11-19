require 'rails_helper'

feature 'sign in' do

  # User Story
  # As an unauthenticated user
  # I want to sign in
  # So that I can post items and review them
  #
  # Acceptance Criteria
  # if i input a registered email and password -> I sign in
  # if i input an unregistered email and password or
  # wrong email and password -> I can't sign in
  # if I am signed in already -> I can't sign in again

  scenario 'signs in with valid registered email and password' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
  end

  scenario 'cannot sign in with unregistered email and password' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: 'nobody@home.com'
    fill_in 'Password', with: 'somepassword1'
    click_button 'Sign In'

    expect(page).to have_content("Invalid email or password.")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'cannot sign in with invalid password' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'whatever'
    click_button 'Sign In'

    expect(page).to have_content("Invalid email or password.")
    expect(page).to_not have_content('Sign Out')
  end

end
