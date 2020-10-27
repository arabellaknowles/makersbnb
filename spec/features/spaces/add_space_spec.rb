require_relative '../../support/web_helpers.rb'
require 'spec_helper'
require 'pg'

feature 'Add spaces' do
  scenario 'user can add spaces that they want to let out' do
    sign_up
    click_button('Add Spaces')
    fill_in('address', with: '12 Ham Street')
    fill_in('description', with: 'A lovely flat on a street made of ham')
    fill_in('price per night', with: '300')
    expect(page).to have_content('A lovely flat on a street made of ham')
  end
end
