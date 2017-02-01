class ArticlesController < ApplicationController
    before_filter :require_login, except: [:show, :index]
    include ArticlesHelper
    
    def index
        if params[:tag]
            @articles = Article.tagged_with(params[:tag])
            
         
             
        else
            @articles = Article.all
        end
    end
    
    def show
        @article = Article.find(params[:id])
        
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.save
    
        flash.notice = "Artykuł '#{@article.title}' został dodany!"
    
        redirect_to article_path(@article)
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        flash.notice = "Artykuł '#{@article.title}' został usunięty!"
        
        redirect_to articles_path
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
      @article = Article.find(params[:id])
      @article.update(article_params)
      
      flash.notice = "Artykuł '#{@article.title}' został uaktualniony!"
    
      redirect_to article_path(@article)
    end
    
end
