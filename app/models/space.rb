class Space
  def self.all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT * FROM spaces")
    result.map do
      Space.new(id:, )
    end
  end
end
