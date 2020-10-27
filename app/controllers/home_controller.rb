class BnB < Sinatra::Base
  get '/' do
    erb(:index)
  end
end
