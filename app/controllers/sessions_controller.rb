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
      @all_requests = Request.where(guest_id: current_user.id).all

      @spaces = []

      @all_requests.each do |request|
        @spaces << Space.find_by(host_id: request.host_id)
      end

      erb(:'/sessions/account')
    end
  end
