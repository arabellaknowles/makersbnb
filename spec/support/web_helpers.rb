def sign_up
  visit('registrations/new')
  fill_in('username', with: 'ADog')
  fill_in('name', with: 'Arabella Kno')
  fill_in('email', with: 'adog@hotmail.com')
  fill_in('password', with: 'ilovedogs')
  click_button('Submit')
end
