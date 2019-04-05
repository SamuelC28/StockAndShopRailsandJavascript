class UsersController < ApplicationController
	 skip_before_action :require_logged_in, only: [:new, :create]
 	 before_action :set_user, only: [:show, :edit, :update, :destroy]
	
  def show
		 @user = User.find_by(id: params[:id])
		 redirect_to signin_session_path unless @user
	end
	
	def new
   @user = User.new
	end
	
	# def edit
  #  @user = User.find_by(id: params[:id])
	# end 

  def create
		 @user = User.new(user_params)
	
	 	# flash.now[:danger] = 'Invalid email/password combination'
		 if @user.save
				session[:user_id] = @user.id
	 	  	redirect_to user_path @user
	 	else
	 		render 'new'
	 	end
  end
	
  def update
  	@user = User.find_by(id: params[:id])
  	if @user.update(user_params)
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end
  
  def destroy
  	@user = User.find_by(id: params[:id])
  	@user.destroy
  	redirect_to users_path
	end
	
	private    
		    def set_user
          @user = User.find_by(id: params[:id])
        end

       def user_params
         params.require(:user).permit(:fullname, :email, :password, :admin)
       end
end
