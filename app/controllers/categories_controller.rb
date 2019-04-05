class CategoriesController < ApplicationController
     before_action :set_category, only: [:show, :edit, :update, :destroy]
    
    def index
        @user_id = session[:id]
        @categories = Category.all
        @items = Item.all 
    end

    def show
       
        @item = Item.new
    end

    def new
       
        puts @user.inspect
        @category = Category.new
        @user_id = session[:user_id]
    end

    def stock_report
        @category = Category.all
        @items = Item.all 
    end


    # def edit
    #     @category = Category.find_by(id: params[:id])
    # end
    
    def create
        @category = Category.new(category_params)
      
        if @category.save # && @category.id = @user.id
            redirect_to @category 
            # 'Category was successfully created.' 
        else
            render 'new'
        end
    end

   
    def update
        @category = Category.find_by(id: params[:id])
        if @category.update(category_params)
              redirect_to @category
            #   'Category was successfully updated.' 
        else
              render 'edit'
        end
    end

    def destroy
        @category = Category.find_by(id: params[:id])
        @category.destroy
        redirect_to categories_path
        # 'Category was successfully destroyed.'
    end

    private

      def set_category
        @category = Category.find_by(id: params[:id])
      
      end
    
    def category_params
      params.require(:category).permit(:category_name)
    end
    
end
