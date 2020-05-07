class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
	# GET /signup
	def new
	  @user = User.new
	end
	
	# POST /users
	def create
		@user = User.new(user_params)
		
		if @user.save
		  flash[:notice] = "Welcome #{@user.username}, you have successfully signed up."
		  redirect_to articles_path
		else
		  render 'new'
		end
	end

	# GET /users/1/edit
	def edit
		#@user = User.find(params[:id])
	end

	# PATCH/PUT /users/1
	def update
		#@user = User.find(params[:id])
		
		if @user.update(user_params)
		  flash[:notice] = "Your account information was successfully updated"
		  redirect_to articles_path
		else
		  render 'edit'
		end
	end
  
private
	# Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
	
	# Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
