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

  scenario 'user sees featurs and benefits'
    visit root_path

    expect(page).to have_content('Plan,Track, And Achieve Your Goals Based On Proven Science')
    expect(page).to have_content('Plan Each Step Like A Domino')
    expect(page).to have_content('Each Finished Task Is A +1')
    expect(page).to have_content("Add Up All The +1's And Achieve Success")
  end

  scenario 'user sees clickable sign up button' do
    visit root_path

    expect(page).to have_content('Sign Up')
  end
end
