class BnB < Sinatra::Base
  get '/registrations/new' do
    erb(:'registrations/new')
  end

  post '/registrations' do
    
  end
end
