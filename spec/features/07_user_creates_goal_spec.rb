require 'rails_helper'

feature 'user creates first goal from dashboard' do
  # User Story
  # as an authenticated user,
  # i want to create my first goal,
  # and fill out the form so i can start working on achieving my goal

  # Acceptance Criteria
  # authenticated user is taken to dashboard,
  # clicks on create a goal button
  # taken to a form page to start filling out the form
  # presses submit and goal shows up in dashboard

  scenario 'user visits goal creating form' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    visit goals_path
    click_link 'Create A Goal'

    expect(page).to have_content("Create Your Number One Goal")
  end

  scenario 'user filles out form in creating goal' do
    user = FactoryBot.create(:user)
    goal = FactoryBot.create(:goal)
    task = FactoryBot.create(:task)
    login_as(user, :scope => :user)
    visit root_path
    visit goals_path
    click_link 'Create A Goal'

    fill_in 'Wish', with: goal.wish
    fill_in 'Outcome', with: goal.outcome
    fill_in 'Obstacle' with: goal.obstacle
    fill_in 'Plan' with: goal.task
    click_button 'Create Goal'

    expect(page).to have_content(goal.wish)
  end

  scenario 'user receives error when form is not filled' do
    user = FactoryBot.create(:user)
    goal = FactoryBot.create(:goal)
    task = FactoryBot.create(:task)
    login_as(user, :scope => :user)
    visit root_path
    visit goals_path
    click_link 'Create A Goal'

    fill_in 'Wish', with: goal.wish
    fill_in 'Outcome', with: goal.outcome
    fill_in 'Plan' with: goal.task
    click_button 'Create Goal'

    expect(page).to have_content("can't be blank")
  end
  
end
