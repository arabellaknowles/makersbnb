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
      @sent = Request.where(guest_id: current_user.id)
      erb(:'/sessions/account')
    end
  end
