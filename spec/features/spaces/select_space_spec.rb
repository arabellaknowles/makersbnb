require_relative '../../support/web_helpers.rb'

feature 'Viewing details of spaces listed on the homepage' do
  scenario 'User clicks listed space on homepage and redirected to info page' do
    sign_up_host
    add_space
    click_on('Sign Out')
    sign_up_guest
    click_button('more info')
    expect(page).to have_button('Make Request')
  end
end