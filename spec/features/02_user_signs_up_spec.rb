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

  end

  scenario 'user enters email and password in form' do
    visit root_path

  end

  scenario 'account created and user is taken dashboard' do

  end

end
