class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    #We use the create method on @article.comments to create and save the comment.
    #This will automatically link the comment so that it belongs to that particular article.
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

   def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
