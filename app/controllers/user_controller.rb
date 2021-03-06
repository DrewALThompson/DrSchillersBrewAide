class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
          redirect '/recipes/index'
        else
          erb :'users/signup'
        end
    end

    post '/signup' do
        @user = User.create(params)
        if @user
            session[:id] = @user.id
            redirect '/recipes/index'
        else
            redirect '/signup'
        end
    end

    get '/login' do
        if logged_in?
            redirect '/recipes/index'
        else
          erb :'/users/login'
        end
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect '/recipes/index'
        elsif @user && !user.authenticate(params[:password])
            redirect '/login'
        else
            redirect '/signup'
        end
    end

    get '/users/:slug' do
        @slug = User.find_by_slug(params[:slug])
        if @slug
            erb :'users/show'
        else
            redirect 'error'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            erb :'index'
        else
            redirect '/'
        end
    end

end
