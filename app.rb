require 'sinatra/base'

# Defining Birthday class
class Birthday < Sinatra::Base

  get '/' do
    erb(:homepage)
  end

  post '/calculate' do
    redirect('/birthday_today')
  end

  get '/birthday_today' do
    erb(:birthday_message)
  end
end
