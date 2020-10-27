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
        redirect('/sign_in')
      end
    end
  end
  