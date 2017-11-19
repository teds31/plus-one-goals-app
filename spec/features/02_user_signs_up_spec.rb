require 'rails_helper'

feature 'new user signs up' do
  # User Story
  # As a user,
  # I want to sign up for POG
  # because I like what the features and benefits are and they are free

  #Acceptance Criteria
  #User clicks on sign up button
  #Ajax request to create account with email and password
  #once form is filled, user clicks done
  #taken to dashboard page

  scenario 'user clicks on sign up button' do
    visit root_path
    click_link 'Sign Up'

    expect(page). to have_content("Create Your Account")
  end

  scenario 'user enters info and email and password in form' do
    visit root_path
    click_button 'Sign Up'

    fill_in 'First name', with: 'Teddy'
    fill_in 'Last name', with: 'Stanowski'
    fill_in 'Email', with: 'teddy@teddy.com'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Create Account'
 
    expect(page).to have_content("Welcome To Your Dashboard")
  end

  scenario 'does not fill out all information' do
    visit root_path
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Welcome To Your Dashboard")
  end

  scenario 'password confirmation does not match' do
    visit root_path
    click_button 'Sign Up'

    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create Account'

    expect(page). to have_content("doesn't match")
    expect(page).to_not have_content("Welcome To Your Dashboard")
  end

end
