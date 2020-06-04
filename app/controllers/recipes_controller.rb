class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipes = Recipe.where(user_id: params[:id])
        #@rating = Rating.find(params[:id])
    end

    def new 
        @recipe = Recipe.new
    end 
    
    def create
    
        @recipe = Recipe.new(recipe_params)
        @user = User.current_user(session)
        @recipe.user = @user
        if @recipe.save
            redirect_to recipe_path(@user)
        else
            render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        @user = User.current_user(session)
        redirect_to recipe_path(@user)
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        @user = User.current_user(session)
        redirect_to recipe_path(@user)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredient_count, :ingredients, :difficulty, :instructions)
    end
end
