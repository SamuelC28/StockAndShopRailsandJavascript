class ItemsController < ApplicationController
    before_action :require_logged_in
 
    before_action :set_item, only: [:show, :edit, :update, :destroy]



    def index
        @category = Category.find_by(id: params[:id])
        # @items = Item.find_by(id: @category_id).items
        @items = Item.all 

        # respond_to do |format|
        #     format.html { render :index}
        #     format.json {renderj json: @items}
        # end
    end
    
    def ticket
        @address = Address.find_by(id: params[:address_id])
    end
    
    def show
        @user= User.find_by(id: session[:id])
        @category = Category.find_by(id: params[:id])
        # @item = Item.find_by(id: params[:id])
        
        @address = Address.find_by(id: params[:id])
        @category = Category.new

        respond_to do |format|
          format.html { render :show }
          format.json {render json: @item } 
        end
    end

    def new
        @user = User.find_by(id: session[:user_id])
        @item = Item.new
    end
    
    def edit
    end

    def create
       
        # --- 1st way-----
        # user = session[:user_id]
        # @item = Item.new(item_params)
        # @item.user = current_user
        puts params.inspect
        # --- 2nd way-----
        @item = current_user.items.build(item_params)
        # photoname= params[:item][:photo].filename
        # photofile= params[:item][:photo][:tempfile]

        # File.open("./public/#{photoname}","wb") do |f|
        #     f.write(photofile.read)
        # end
        
        @category = Category.find_by(id: params[:item][:category_id])

        respond_to do |format|
            if @item.save
                format.html { redirect_to item_path(@item), notice: 'Item was successfully created.'}
                format.json { render :show, status: :created, location: @item}
            else
                format.html { redirect_to new_item_path }
                format.json { render json: @item.errors, status: :unprocessable_entity }
            end
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
        redirect_to stock_report_path
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

