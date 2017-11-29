require 'rails_helper'

feature 'user deletes account' do
  # User Story
  # As an authenticated user I want to delete my account
  # So that my information is no longer retained by the app
  #
  # Acceptance Criteria
  # As a user, I want to visit my account page
  # and successfully delete my account by clicking on delete
  # receive a confirmation message and taken back to index page

  scenario 'user deletes account in My Account' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path

    click_link 'My Account'
    click_button 'Cancel my account'
    save_and_open_page

    expect(page).to have_content("Sorry to see you go. Your account has been successfully cancelled.")
    expect(page).to have_content("Sign Up")
  end
end
