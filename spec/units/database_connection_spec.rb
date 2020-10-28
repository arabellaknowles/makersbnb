require_relative '../../app/models/database_connection'

describe DatabaseConnection do
  it 'connects to to the database' do
    expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

    DatabaseConnection.setup(dbname: 'makersbnb_test')
  end

  it 'connects to the database and executes a query' do
    connection = DatabaseConnection.setup(dbname: 'makersbnb_test')

    expect(connection).to receive(:exec).with("SELECT * FROM users;")

    DatabaseConnection.query("SELECT * FROM users;")
  end
end