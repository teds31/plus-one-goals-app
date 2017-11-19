require 'rails_helper'

feature 'authenticated user signs out' do
  # User Story
  # As an authenticated user I want to sign out
  # So that no one else can post items or reviews on my behalf
  #
  # Acceptance Criteria
  # As an authenticated user already signed in
  # I want to be able to see the sign out link to click on
  # Which will lead to me signing out of my profile on the site
  # And lead me back to either signing in or signing up on the index page

  scenario 'signs out' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path

    click_link 'Sign Out'

    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end
end
