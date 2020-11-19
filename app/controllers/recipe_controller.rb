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
        @recipe = Recipe.create(params)
        @recipe.user = @current_user
        if @recipe
            redirect '/recipes/index'
        else
            redirect '/recipes/new'
        end
    end 

    get '/recipes/:id' do
        if logged_in?
          @recipe = Recipe.find_by(id: params[:id])
          erb :"recipes/show"
        else
          redirect to '/login'
        end
    end

    get '/recipes/:id/edit' do
        @recipe = Recipe.find_by(id: params[:id])
        if logged_in? && @Recipe.user == current_user
          erb :"Recipe/edit"
        else
          redirect to '/login'
        end
      end
    
      patch '/recipes/:id/edit' do
        @recipe = Recipe.find_by(id: params[:id])
        @user = current_user
        if @recipe.update(content: params[:content], user: @user)
          redirect to "/recipes/#{@recipe.id}"
        else
          redirect to "/recipe/#{@recipe.id}/edit"
        end
      end
    
      delete '/recipes/:id/delete' do
        @recipe = current_user.recipes.find_by(:id => params[:id])
        if @recipe && @recipe.destroy
          redirect "/recipes/index"
        else
          redirect "/recipes/#{@recipe.id}"
        end
      end
end
