feature 'Viewing more detailed information about selected space' do

  before do
    sign_up_host
    add_space
    click_on('Sign Out')
    sign_up_guest
    click_link('more_info')
  end

  scenario 'User clicks listed space on homepage and redirected to info page' do
    expect(page).to have_button('Make Request') 
  end

  scenario "User can see host's contact details" do
    expect(page).to have_content('Contact Charlie Ga at: cdog@hotmail.com')
  end

end
