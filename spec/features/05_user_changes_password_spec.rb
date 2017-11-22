require 'rails_helper'

feature 'user changes password on account' do
  # User Story
  # as an authenticated user
  # i want to change my password
  # to make my account more secure

  # Acceptance Criteria
  # as an authenticated user
  # i visit my account page
  # go to change my password forms
  # enter it twice, then submit to save

  scenario 'user visits account page after signing in' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    click_link 'My Account'

    expect(page).to have_content(user.first_name)
    expecet(page).to have_content(user.last_name)
  end

  scenario 'user changes password' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    click_link 'My Account'

    fill_in 'Password' with: 'newPassword1'
    fill_in 'Password confirmation' with: 'newPassword1'
    click_button 'Update'

    expect(page).to have_content('Your password has been changed successfully.')
  end

  scenario 'user does not confirm new password' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    click_link 'My Account'

    fill_in 'Password' with: 'newPassword1'
    fill_in 'Password confirmation' with: ''
    click_button 'Update'

    expect(page).to have_content('Please fill out all forms.')
  end
end
