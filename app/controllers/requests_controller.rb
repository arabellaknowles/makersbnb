class BnB < Sinatra::Base
  
  get '/requests/new' do
    if current_user   
      erb(:'requests/new')
    else
      flash[:notice] = "Please log in to make a request"
      redirect("/spaces/#{params[:space_id]}/moreinfo")
    end
  end
end