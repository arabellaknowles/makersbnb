feature "requests" do
  scenario "user can't make request if not logged in" do
    sign_up_host
    add_space
    click_button('Sign Out')
    spaces = Space.all

    first_space = spaces[0]
    
    within("div##{first_space.id}") do
      click_button("More Info")
    end

    click_button('Make Request')
    expect(current_path).to eq "/spaces/#{first_space.id}/moreinfo"
    expect(page).to have_content('Please log in to make a request')
  end

  scenario 'user can make request if signed in' do
    sign_up_host
    add_space
    click_button('Sign Out')
    sign_up_guest

    spaces = Space.all

    first_space = spaces[0]
    
    within("div##{first_space.id}") do
      click_button("More Info")
    end

    click_button('Make Request')
    expect(current_path).to eq "/requests/new"
    
    fill_in 'start_date', with: '12/03/2021'
    fill_in 'end_date', with: '17/03/2021'
    click_button('Submit Request')
    # dates are free

    expect(current_path).to eq("/spaces/#{first_space.id}/moreinfo")
    expect(page).to have_content("Host will be notified about your request")
  end
end