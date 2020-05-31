class RatingsController < ApplicationController
    def index
        @ratings = Rating.all
    end

    def show
        @ratings = Rating.where(recipe_id: params[:id])
        @recipe = Recipe.find_by(id: params[:id])
    end

    def new 
        @rating = Rating.new(recipe_id: params[:recipe_id])
    end 
    
    def create
        @rating = Rating.create(rating_params)
        @rating.user_id = User.current_user(session).id
        @rating.save
        redirect_to recipes_path
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    def update
        @rating = Rating.find(params[:id])
        @rating.update(rating_params)
        redirect_to rating_path(@rating)
    end

    def destroy
        @rating = Rating.find(params[:id])
        @rating.destroy
        redirect_to rating_url
    end

    private

    def rating_params
        params.require(:rating).permit(:recipe_id, :stars, :description)
    end

end
