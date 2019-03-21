require 'sinatra/base'

class Birthday < Sinatra::Base

get '/' do
  'Hello! Please enter your birthday below...'
end

end
