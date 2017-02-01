class CommentsController < ApplicationController
  before_filter :require_login, except: [:create]
  
    def index
      @comments = Comment.all
    end
    
    def show
    end
    
    def create
      @comment = Comment.new(comment_params)
      @comment.article_id = params[:article_id]
    
      @comment.save
    
      redirect_to article_path(@comment.article)
    end
    
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
        
      redirect_to article_path(@article), notice: "Komentarz usunięty!"
    end

    def comment_params
      params.require(:comment).permit(:author_name, :body)
    end
end
