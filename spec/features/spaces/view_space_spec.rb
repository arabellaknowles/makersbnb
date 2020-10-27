require_relative '../../support/web_helpers.rb'
require 'spec_helper'
require 'pg'

feature 'Space listings' do
  scenario 'user can see listed spaces on the homepage' do
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO spaces (host_id, name, description, price_per_night, start_date, end_date) VALUES ('1', '12 Ham Street', 'A lovely flat on a street made of ham', '300', '01/02/2021', '10/02/2021');")
    sign_up
    expect(page).to have_content('A lovely flat on a street made of ham')
  end
end
