feature 'Registrations' do
  scenario 'user can sign up and be signed in' do
    visit('registrations/new')
    fill_in('username', with: 'ADog')
    fill_in('name', with: 'Arabella Kno')
    fill_in('email', with: 'adog@hotmail.com')
    fill_in('password', with: 'ilovedogs')
    click_button('Submit')
    expect(page.current_path).to eq('/')
    expect(page).to have_content('Hi, Arabella Kno')
  end
end
