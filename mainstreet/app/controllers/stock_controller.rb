class StockController < ApplicationController
  # GET /search_stock
   def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      
      if @stock
        respond_to do |format|
          format.js { render partial: 'stock/stock' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          
          format.js { render partial: 'layouts/messages' }
        end
      end    
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        
        format.js { render partial: 'layouts/messages' }
      end
    end
  end
end
