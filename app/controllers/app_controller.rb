class BnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :root, File.dirname(File.expand_path('..', __FILE__))
end
