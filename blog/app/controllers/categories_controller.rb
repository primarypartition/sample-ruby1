class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update]
	before_action :require_admin, except: [:index, :show]
  
	# GET /categories
	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end
	
	# GET /categories/1
	def show
		@articles = @category.articles.paginate(page: params[:page], per_page: 5)
	end	
	
	# GET /categories/new
	def new
		@category = Category.new
	end
	
	# POST /categories
	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "Category was created successfully"

			redirect_to categories_path
		else
			render 'new'
		end
	end
	
	# GET /categories/1/edit
  def edit
  
  end

	# PATCH/PUT /categories/1
	def update	
    if @category.update(category_params)
      flash[:notice] = "Category was updated successfully."
      
      redirect_to @category
    else
      render 'edit'
    end	
  end
	
private
	#
	def set_category
		@category = Category.find(params[:id])
	end
	
	#
	def category_params
		params.require(:category).permit(:name)
	end
	
	#
	def require_admin
		if !logged_in? || (logged_in? and !current_user.admin?)
			flash[:alert] = "Only admins can perform that action"

			redirect_to categories_path
		end
	end
end
