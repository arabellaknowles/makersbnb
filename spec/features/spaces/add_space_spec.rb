require_relative '../../support/web_helpers.rb'
require 'spec_helper'
require 'pg'

feature 'Add spaces' do
  scenario 'user can add spaces that they want to let out' do
    sign_up_host
    click_button('Add Space')
    fill_in('name', with: '12 Ham Street')
    fill_in('description', with: 'A lovely flat on a street made of ham.')
    fill_in('price_per_night', with: '300')
    fill_in('start_date', with: '01/02/2021')
    fill_in('end_date', with: '18/03/2021')
    click_button('Submit')
    expect(page).to have_content('A lovely flat on a street made of ham.')
  end
end
