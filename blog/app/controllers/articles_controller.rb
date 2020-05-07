class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
	# byebug
    #@article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    #@article = Article.new(params.require(:article).permit(:title, :description))
    @article = Article.new(article_params)
		
	@article.user = User.first 
	
	if @article.save	  
	  flash[:notice] = "Article was created successfully."
	  redirect_to @article
	  #redirect_to article_path(@article)	
	else
      render :new 
	end
	
    #respond_to do |format|
    #  if @article.save
    #    format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #    format.json { render :show, status: :created, location: @article }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @article.errors, status: :unprocessable_entity }
    #  end
    #end

  end

  # GET /articles/1/edit
  def edit
	#@article = Article.find(params[:id])
  end

  # PATCH/PUT /articles/1
  def update
	#@article = Article.find(params[:id])
	
	#if @article.update(params.require(:article).permit(:title, :description))
	if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end	
  
    #respond_to do |format|
    #  if @article.update(article_params)
    #    format.html { redirect_to @article, notice: 'Article was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @article }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @article.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /articles/1
  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
	
    #@article.destroy
    #respond_to do |format|
    #  format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
