module ApplicationHelper
    def current_user
        User.find_by(id: session[:user_id]) if session[:user_id]
    end

   def logged_in?
    !!current_user
  end

   def require_logged_in
      redirect_to root_path unless logged_in?
    end

    def current_cart 
      Cart.find_by(user_id:current_user.id)
    end

    def get_total_price(cart)
      # cart.map{|x| x[:unit_price]}.reduce(:+)
      puts "----------------"
      puts cart.inspect 
      puts "----------------"
      total=0
      cart.each do |item|
        if item.any?
          total+=item["unit_price"] * item["chosen_quantity"]
        end
      end
      total
    end
    

end