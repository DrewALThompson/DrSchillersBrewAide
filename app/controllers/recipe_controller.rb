class RecipeController < ApplicationController

    get '/recipes' do
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
        @recipe = Recipe.create(params)
        if @recipe
            redirect '/recipes'
        else
            redirect '/recipes/error'
    end 
end
