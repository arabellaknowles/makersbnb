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
end