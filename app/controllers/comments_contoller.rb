class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    end
  
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
      @comment = @article.comments.id(params[:id])
    end
  
    private
      def comment_params
        params.require(:comment).permit(:commenter, :id, :body)
      end
  end
  
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def create
    @article = Article.find(params[:article_id])
    # ...
  end
