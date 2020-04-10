class TagsController < ApplicationController
    def index
        @tags = Tag.all
    end

    def show
        @tag = Tag.new
        session[:recipe_id] = params[:id]
    end

    def new 
        @tag = Tag.new
    end 
    
    def create
        @tag = Tag.new(tag_params)
        if @tag.valid?
            @tag.recipe_ids = (session[:recipe_id])
            @tag.save
            @user = User.current_user(session)
            redirect_to recipe_path(@user)
        else
            render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def tag_params
        params.require(:tag).permit(:name)
    end

end
