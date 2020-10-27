require 'spec_helper'

feature 'Registrations' do
  before do
    user = User.new(username: 'test101', name: 'Test Person', email: 'test@test.com')
    user.password = 'test12'
    user.save!
  end

  scenario 'user can sign up and be signed in' do
    visit('/sign_in')
    fill_in('username', with: 'test101')
    fill_in('password', with: 'test12')
    click_button('Submit')
    expect(page.current_path).to eq('/')
    expect(page).to have_content('Hi, Test Person')
  end

  scenario 'user can not sign up and is redirected' do
    visit('/sign_in')
    fill_in('username', with: 'incorrecttest101')
    fill_in('password', with: 'test12')
    click_button('Submit')
    expect(page.current_path).to eq('/sign_in')
  end

  scenario 'user can not sign up, uses wrong password, and is redirected' do
    visit('/sign_in')
    fill_in('username', with: 'test101')
    fill_in('password', with: 'incorrecttest12')
    click_button('Submit')
    expect(page.current_path).to eq('/sign_in')
  end

  scenario 'user can sign out' do
    visit('/sign_in')
    fill_in('username', with: 'test101')
    fill_in('password', with: 'test12')
    click_button('Submit')
    click_button('Sign Out')
    puts page.body
    expect(page).not_to have_content('Hi, Test Person')
  end
end
