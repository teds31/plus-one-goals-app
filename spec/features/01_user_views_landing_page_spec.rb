require 'rails_helper'

feature 'user views app features and benefits' do
  #User Story
  #As a prospective user, I want to learn more
  #about the features and benefits of the app
  #so I can set and achieve my goals

  #Acceptance Criteria
  #User visits landing/homepage
  #User able to scroll down and see detailed grpahics and info
  #User able to see a clickable sign up button

  scenario 'user visits landing page' do
    visit root_path

    expect(page).to have_content('+1 Goals')
  end

  scenario 'user sees featurs and benefits' do
    visit root_path

    expect(page).to have_content('Plan, Track And Achieve')
    expect(page).to have_content('Plan With The End In Mind')
    expect(page).to have_content('+1 Every Task Completed')
    expect(page).to have_content('Success When You Add It All Up')
  end

  scenario 'user sees clickable sign up button' do
    visit root_path

    expect(page).to have_content('SIGN UP')
  end

end
