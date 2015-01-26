class ArticlesController < ApplicationController

#====================== 7 Action default of a controller 
#======================INDEX, CREATE, NEW,EDIT SHOW, UPDATE, UPDATE, DESTROY========

#  http_basic_authenticate_with name: "123", password: "123", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    article = Article.new(article_params)
    article.save
    redirect_to article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    p "ArticleController #show"
    p params[:id];
#    p params[:article][:title];
    @article = Article.find(params[:id])
  end

  def update
    p "ArticleController #update"
    p params[:id];
    p params[:article][:title];

    @article = Article.find(params[:id])
 
    if @article.update_attributes article_params
       #redirect_to @article
       #redirect_to articles_path
       flash[:success] = "Update success!"
       redirect_to articles_url
    else
     render 'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end  
#=========================================================================================================================

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
