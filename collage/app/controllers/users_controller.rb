class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  # GET users
  def index 
    @students = User.all  
  end
  
  # GET /users/1
  def show
    @courses = @user.courses.all
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # POST /users
  def create 
    @user = User.new(user_params)
	  
    if @user.save	  
      session[:user_id] = @user.id	
      flash[:success] = "Student was created successfully."
      
      redirect_to @user   
    else
      render :new
    end
  end
  
  # GET /user/1/edit
  def edit
    
  end
  
  # PUT /users/1
  def update    
    if @user.update(user_params)
		  flash[:notice] = "Your account information was successfully updated."
      
		  redirect_to user_path @user
		else
		  render 'edit'
		end
  end  
  
  # DELETE /users/1
	def destroy
		@user.destroy
		session[:user_id] = nil if @user == current_user
		flash[:notice] = "Account and all associated articles successfully deleted"
		
		redirect_to root_path
  end
  
private
 # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
	
	# Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
	
	# Require same user for action
	def require_same_user
		if current_user != @user && !current_user.admin?
		  flash[:alert] = "You can only edit or delete your own profile."
		  
		  redirect_to @user
		end
	end
end
