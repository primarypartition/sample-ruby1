class UsersController < ApplicationController
  # GET /users/1
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end
  
  # GET /my_portfolio
  def my_portfolio
    @user = current_user    
    @tracked_stocks = current_user.stocks
  end
  
  # GET /my_friends
  def my_friends
    @friends = current_user.friends
  end
  
  # GET /search_friend
  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      
      if @friends
        respond_to do |format|
          format.js { render partial: 'friendships/friend_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          
          format.js { render partial: 'layouts/messages' }
        end
      end    
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email to search"
        
        format.js { render partial: 'layouts/messages' }
      end
    end
  end
end
