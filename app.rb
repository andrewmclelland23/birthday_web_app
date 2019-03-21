require 'sinatra/base'

# Defining Birthday class
class Birthday < Sinatra::Base

  get '/' do
    erb(:homepage)
  end

  
end
