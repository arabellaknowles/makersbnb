feature 'Sessions' do
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
    expect(page).to have_button('Sign Out')
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
    expect(page).not_to have_content('Hi, Test Person')
  end

  scenario 'users can see prompt to register on signin page' do
    visit('/sign_in')
    click_link('Sign Up')
    fill_in('username', with: 'useruser')
    fill_in('name', with: 'User User')
    fill_in('email', with: '123@hotmail.com')
    fill_in('password', with: 'iloveusers')
    click_button('Submit')
    expect(page).to have_content('Hi, User User')
  end

  scenario 'user gets shown message if username/pwd incorrect' do
    visit('/sign_in')
    fill_in('username', with: 'test111101')
    fill_in('password', with: 'test1212312')
    click_button('Submit')
    expect(page.current_path).to eq('/sign_in')
    expect(page).not_to have_content('Hi, Test Person')
    expect(page).to have_content('Username or password incorrect, please try again.')
  end

  scenario 'user gets a message when they sign out' do
    visit('/sign_in')
    fill_in('username', with: 'test101')
    fill_in('password', with: 'test12')
    click_button('Submit')
    click_button('Sign Out')
    expect(page).to have_content('You are signed out')
  end
end
