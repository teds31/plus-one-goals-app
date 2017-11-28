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
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'My Account'

    expect(find_field('First name').value).to eq user.first_name
    expect(find_field('Last name').value).to eq user.last_name
  end

  scenario 'user changes password' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'My Account'

    fill_in 'Password', with: 'newPassword1'
    fill_in 'Password confirmation', with: 'newPassword1'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'user does not confirm new password' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'My Account'

    fill_in 'Password', with: 'newPassword1'
    fill_in 'Password confirmation', with: ''
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content("Password confirmation can't be blank")
  end
end
