class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create 

    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :status, :body)
  end
end
