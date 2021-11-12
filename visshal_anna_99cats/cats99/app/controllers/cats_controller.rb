class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create 
        @cat = Cat.new(cat_param)
        #maybe some error ternary?
        @cat.save
        redirect_to cat_url(@cat)
        #cats (when you want to push to the table) vs cat_url (when you're dealing with a single instance of a cat)
    end

    def destroy
    end

    private

    def cat_param
        params.require(:cat).permit(:name, :birth_date, :color, :description, :sex)
    end
end