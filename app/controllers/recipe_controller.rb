class RecipesController < ApplicationController

    get '/recipes/index' do
        @recipes = Recipe.all 
        erb :'/recipes/index'
    end

    get '/recipes/new' do
        if logged_in?
            erb :'/recipes/new'
        else
            redirect '/login'
        end
    end

    post '/recipes/new' do 
        @user = current_user
        @recipe = Recipe.create(params)
        if @recipe
            redirect '/recipes/index'
        else
            redirect '/recipes/new'
        end
    end 
end
