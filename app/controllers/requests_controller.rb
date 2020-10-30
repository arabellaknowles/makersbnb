class BnB < Sinatra::Base
  
  # get '/requests/new' do
  #   if current_user   
  #     @space = Space.find_by(id: params[:space_id])
  #     @host = User.find_by(id: params[:host_id])
  #     @guest = current_user
  #     erb(:'requests/new')
  #   else
  #     flash[:notice] = "Please log in to make a request"
  #     redirect("/spaces/#{params[:space_id]}/moreinfo")
  #   end
    
  # end

  post '/requests' do
    # space id, host id, user id
    Request.create(
      host_id: params[:host_id], 
      guest_id: params[:guest_id], 
      space_id: params[:space_id], 
      start_date: params[:start_date], 
      end_date: params[:end_date]
    )
    flash[:notice] = "Request sent! The host has been notified."
    redirect("/spaces/#{params[:space_id]}/moreinfo")
  end
end