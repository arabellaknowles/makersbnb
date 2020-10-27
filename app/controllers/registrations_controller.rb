class BnB < Sinatra::Base
  get '/registrations/new' do
    erb(:'registrations/new')
  end

  post '/registrations' do
    user = User.new(name: params[:name], username: params[:username],email:  params[:email])
    user.password = params[:password]
    user.save!
    p user
    redirect('/')
  end
end
