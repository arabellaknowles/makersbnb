require 'pg'

class Space
  attr_reader :name, :description, :price_per_night

  def initialize(name:, description:, price_per_night:)
    @name = name
    @description = description
    @price_per_night = price_per_night
  end

  def self.all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT * FROM spaces;")
    result.map do |space|
      Space.new(name: space['name'], description: space['description'], price_per_night: space['price_per_night'])
    end
  end
end
