class BnB < Sinatra::Base
  get '/registrations/new' do
    erb(:'registrations/new')
  end

  # post '/registrations' do
  #   user = User.new(name: params[:name], username: params[:username], email: params[:email])
  #   username_check = User.find_by(username: user.username)
  #   email_check = User.find_by(email: user.email)
  #   user.password = params[:password]
  #   if user.save!
  #     session[:user_id] = user.id
  #     redirect('/')
  #   else

  #   end
  # end

  post '/registrations' do
    username_check = User.find_by(username: params[:username])
    email_check = User.find_by(email: params[:email])
    if username_check && email_check
      flash[:notice] = "Username and email already exist, choose a different one"
      redirect ('/registrations/new')
    elsif username_check 
      flash[:notice] = "Username already exists, choose a different one"
      redirect ('/registrations/new')
    elsif email_check
      flash[:notice] = "Email already exists, choose a different one"
      redirect ('/registrations/new')
    else
      user = User.new(name: params[:name], username: params[:username], email: params[:email])
      user.password = params[:password]
      user.save!
      session[:user_id] = user.id
      redirect('/')
    end
  end
end
