require 'sinatra/base'

# Defining Birthday class
class Birthday < Sinatra::Base

  get '/' do
    erb(:homepage)
  end

  post '/calculate' do
    "It's your Birthday today! Happy Birthday Andy!"
  end
end
