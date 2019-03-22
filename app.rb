require 'sinatra/base'
require_relative './lib/birthday_calc.rb'
# Defining Birthday class
class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:homepage)
  end

  post '/calculate' do
    session[:birthday] = params[:birthday]
    session[:name] = params[:name]
    birthday = BirthdayCalc.new.birthday_today?(session[:birthday])
    birthday ? redirect('/birthday_today') : redirect('/birthday_countdown')
  end

  get '/birthday_today' do
    erb(:birthday_message)
  end

  get '/birthday_countdown' do
    days_to_bday = BirthdayCalc.new.countdown(session[:birthday])
    erb(:countdown_message, locals: { days_to_bday: days_to_bday })
  end
end
