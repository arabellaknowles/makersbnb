class BnB < Sinatra::Base

  get '/spaces/new' do
    erb(:'/spaces/new')
  end

  post '/spaces' do
    host_id = session[:user_id]
    Space.create(
      host_id: host_id,
      name: params[:name],
      description: params[:description],
      price_per_night: params[:price_per_night],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    #Add flash notice to confirm
    redirect '/'
  end
end
