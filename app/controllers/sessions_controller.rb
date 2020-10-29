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
      @sent_requests = Request.where(guest_id: current_user.id).all

      @requested_spaces = []

      @sent_requests.each do |request|
        @requested_spaces << Space.find_by(id: request.space_id)
      end

      # currently outputs first host space rather than specific requested space
      
      @received_requests = Request.where(host_id: current_user.id).all

      @my_spaces = []

      @received_requests.each do |request|
        @my_spaces << Space.find_by(id: request.space_id)
      end
      
      erb(:'/sessions/account')
    end


  end
