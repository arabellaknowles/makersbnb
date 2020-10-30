class BnB < Sinatra::Base
  post '/requests' do
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

  delete '/requests/:id' do
    Request.delete(params[:request_id])
    if params[:choice] == "delete"
      flash[:notice] = "Request Denied for #{params[:space_name]}: from #{params[:start_date]} to #{params[:end_date]}."
      redirect("/sessions/#{current_user.id}")
    else
      Booking.create(guest_id: params[:guest_id], space_id: params[:space_id], start_date: params[:start_date], end_date: params[:end_date])
      redirect("/sessions/#{current_user.id}")
    end
  end
end
