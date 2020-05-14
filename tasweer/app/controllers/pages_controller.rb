class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  
  # GET /
  def home
  
  end
end
