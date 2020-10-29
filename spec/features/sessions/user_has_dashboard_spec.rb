feature 'user has dashboard' do
  scenario 'user can access account dashboard from home page when signed in' do
    sign_up_host
    add_space
    click_button('Sign Out')
    make_request
    visit('/')
    click_button('My Account')
    within("div#sent") do
      expect(page).to have_content("12 Ham Street")
    end
    click_button('Sign Out')

    sign_up_host
    visit('/')
    click_button('My Account')
    within("div#received") do
      expect(page).to have_content("12 Ham Street")
    end

    # hi user, name, email, - allow change email
    # two boxes sent / received
    # in sent just request
    # received: tick /crosss
  end
end