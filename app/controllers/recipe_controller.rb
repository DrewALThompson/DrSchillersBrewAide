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
      @recipe = Recipe.create(name: params[:name], hops: params[:hops], malt: params[:malt], grain: params[:grain], yeast: params[:yeast], user_id: params[:user_id])
      if @recipe.save
          redirect "/recipes/index"
      else
          redirect '/recipes/new'
      end
    end 

    get '/recipes/:id' do
      @recipe = Recipe.find_by(id: params[:id])
      erb :"recipes/show"
    end

    get '/recipes/:id/edit' do
      @recipe = Recipe.find_by(id: params[:id])
      if @recipe.user == current_user
        erb :"recipes/edit"
      else
        redirect to '/login'
      end
    end
    
    patch '/recipes/:id' do
      @recipe = Recipe.find_by(id: params[:id])
      @recipe.update(name: params[:name], hops: params[:hops], malt: params[:malt], grain: params[:grain], yeast: params[:yeast], user_id: params[:user_id])
      if @recipe
        redirect to "/recipes/#{@recipe.id}"
      else
        redirect to "/recipes/#{@recipe.id}/edit"
      end
    end
    
    delete '/recipes/:id' do
      Recipe.destroy(params[:id])
      redirect to '/recipes/index'
    end
end
