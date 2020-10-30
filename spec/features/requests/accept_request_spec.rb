feature "accepting requests" do
    scenario "host can accept a request" do
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
  
  
      within("div#received") do
        expect(page).to have_content("12 Ham Street")
      end
  
      within("div#received_#{request.id}") do
        click_button('Accept')
      end
  
      within("div#received") do
        expect(page).not_to have_content("12 Ham Street")
      end
      
      space = Space.find_by(host_id: 1)

      within("div#spaces_#{space.id}") do
        expect(page).not_to have_content("Start Date: 01/02/2021")
      end
      # account page: info on top, requests:sent/received, your spaces: space: booking 1, 2, 3 
    end
  end