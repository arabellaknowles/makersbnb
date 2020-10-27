require './app/models/space'
require 'pg'

describe 'Space' do
  describe '.all' do
    it 'retrieves and returns stored spaces' do
      connection = PG.connect(dbname: 'makersbnb')
      connection.exec("INSERT INTO spaces (host_id, name, description, price_per_night, start_date, end_date) VALUES ('1', '12 Ham Street', 'A lovely flat on a street made of ham', '300', '01/02/2021', '10/02/2021');")
      
      spaces = Space.all

      expect(spaces.first.name).to eq('12 Ham Street')
    end
  end
end