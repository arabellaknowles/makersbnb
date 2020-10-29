require 'pg'

feature 'Space listings' do
  scenario 'user can see listed spaces on the homepage' do
    sign_up_host
    add_space
    click_button('Sign Out')
    expect(page).to have_content('A lovely flat on a street made of ham')
  end
end

