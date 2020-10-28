require './app/models/space'
require 'pg'

describe 'Space' do
  it 'stores and retrives spaces' do
    Space.create(host_id: '2', name: 'Jack Daniels', description: 'Humble abode in the country', price_per_night: '45', start_date: '12.03.2020', end_date: '14.03.2020')
    spaces = Space.all
    expect(spaces.first.name).to eq('Jack Daniels')
    expect(spaces.first.description).to eq('Humble abode in the country')
    expect(spaces.first.price_per_night).to eq('45')
  end
  it 'can find space by id' do
    country_space = Space.create(host_id: '2', name: 'Jack Daniels', description: 'Humble abode in the country', price_per_night: '45', start_date: '12.03.2020', end_date: '14.03.2020')
    Space.create(host_id: '5', name: 'Joe Under', description: 'Squat house', price_per_night: '5', start_date: '15.03.2020', end_date: '19.03.2020')
    Space.create(host_id: '7', name: 'Jack Jones', description: 'City house', price_per_night: '10', start_date: '20.03.2020', end_date: '14.03.2020')
    expect(country_space).to eq Space.find_by(id: country_space.id)
  end
end