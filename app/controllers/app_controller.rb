require 'sinatra/flash'

class BnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  set :root, File.dirname(File.expand_path('..', __FILE__))
  
  enable :sessions
  enable :method_override

  def current_user
    User.find_by(id: session[:user_id])
  end
end
