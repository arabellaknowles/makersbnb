class BnB < Sinatra::Base
    get '/sign_in' do
      erb(:'sessions/new')
    end

    post '/sessions' do
      user = User.authenticate(username: params[:username], password: params[:password])
      if user
        session[:user_id] = user.id
        redirect('/')
      else
        flash[:notice] = "Username or password incorrect, please try again."
        redirect('/sign_in')
      end
    end

    delete '/sessions' do
      flash[:notice] = "You are signed out"
      session.delete(:user_id)
      redirect('/')
    end

    get '/sessions/:id' do
      @arr1 = []
      @sent_requests = Request.where(guest_id: current_user.id).all
      @sent_requests.each do |request|
        @arr1 << {Space.find_by(id: request.space_id) => request}
      end

      @arr2 = []
      @received_requests = Request.where(host_id: current_user.id).all
      @received_requests.each do |request|
        @arr2 << {Space.find_by(id: request.space_id) => request}
      end
      
      @spaces = Space.where(host_id: current_user.id).all
      
      @bookings = Booking.all

      erb(:'/sessions/account')
    end
  end
