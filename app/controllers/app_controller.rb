class BnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :root, File.dirname(File.expand_path('..', __FILE__))
  
  enable :sessions

  def current_user
    User.find_by(id: session[:user_id])
  end
end
