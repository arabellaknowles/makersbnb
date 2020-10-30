feature 'view bookings' do
  scenario 'guest can view bookings on my account page' do
    sign_up_host
    add_space
    click_button('Sign Out')
    make_request
    visit('/')
    click_button('Sign Out')

    click_button('Sign In')
    fill_in 'username', with: 'CDog'
    fill_in 'password', with: 'ihatedogs'
    click_on('Submit')
    click_button('My Account')

    request = Request.find_by(host_id: 1)

    within("div#received_#{request.id}") do
      click_button('Accept')
    end
    click_button('Sign Out')
    click_button('Sign In')
    fill_in 'username', with: 'ADog'
    fill_in 'password', with: 'ilovedogs'
    click_on('Submit')
    click_button('My Account')

    within("div#bookings") do
      expect(page).to have_content("12 Ham Street")
    end
  end
end