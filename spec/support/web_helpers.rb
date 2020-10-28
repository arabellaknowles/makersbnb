def sign_up_guest
  visit('registrations/new')
  fill_in('username', with: 'ADog')
  fill_in('name', with: 'Arabella Kno')
  fill_in('email', with: 'adog@hotmail.com')
  fill_in('password', with: 'ilovedogs')
  click_button('Submit')
end

def sign_up_host
  visit('registrations/new')
  fill_in('username', with: 'CDog')
  fill_in('name', with: 'Charlie Ga')
  fill_in('email', with: 'cdog@hotmail.com')
  fill_in('password', with: 'ihatedogs')
  click_button('Submit')
end

def add_space
  click_button('Add Space')
  fill_in('name', with: '12 Ham Street')
  fill_in('description', with: 'A lovely flat on a street made of ham.')
  fill_in('price_per_night', with: '300')
  fill_in('start_date', with: '01/02/2021')
  fill_in('end_date', with: '18/03/2021')
  click_button('Submit')
end
