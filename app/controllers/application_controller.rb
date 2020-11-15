require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "7H1515453cR37d0n77311BrYc3"
  end

  get "/" do
    erb :index
  end

  helpers do
    logged_in?
      !!current_user
    end

    current_user
      @current_user? @current_user : User.find(session[:id]) if session[:id]
    end
  end



end
