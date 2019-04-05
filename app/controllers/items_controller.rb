class ItemsController < ApplicationController
    before_action :require_logged_in
 
    before_action :set_item, only: [:show, :edit, :update, :destroy]

    def index
        @category = Category.find_by(id: params[:id])
        # @items = Item.find_by(id: @category_id).items
        @items = Item.all 
        
    end
    
    def show
    end
    def show
        @user= User.find_by(id: session[:id])
        @item = Item.find_by(id: params[:id])
        @category = Category.find_by(id: params[:id])
        @category = Category.new
    end

    def new
        @user = User.find_by(id: session[:user_id])
        @item = Item.new
    end
    
    def edit
        # @item = Item.find_by(id: params[:id])
    end

    def create
        user = session[:user_id]
    
        @item = Item.new(item_params)
        # @item.cart=current_cart
        @item.user = current_user
        @category = Category.find_by(id: params[:item][:category_id])
    
        # @item.user_id = @user.id
        if @item.save
            redirect_to item_path(@item) # new_item_path
        else
            redirect_to new_item_path
        end
    end

    def add_item
        item = Item.find_by(id: params[:item_id])
        current_user
        if session[:cart]
          @cart = session[:cart]
        else
          session[:cart] = []
          @cart = session[:cart]
        end

        @cart.push(item) if Item.exists?(item.id)
        redirect_to items_path

        # @cart.clear if current_user.nil?
        # redirect_to root_path
    end

 

   
    def update
        @item = Item.find_by(id: params[:id])
        if @item.update(item_params)
              redirect_to @item
        else
              render 'edit'
        end
    end

    def remove_item_from(cart)
        @cart.delete_at(item)
      end

    def destroy
        @item = Item.find_by(id: params[:id])
        @item.destroy
        redirect_to items_path

    end

    private
       def set_item
           @item = Item.find_by(id: params[:id])
       end
       
       def item_params
         params.require(:item).permit(:item_name, :unit_price, :tax, 
                                      :quantity, :photo, :isbn, :desc, 
                                      :chosen_quantity, category_ids:[])
       end
end

