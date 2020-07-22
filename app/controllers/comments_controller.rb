class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    def create
        @temp = Article.find(params[:article_id])
        @comment = @temp.comments.create(comment_params)
        redirect_to article_path(@temp)
    end
    #def destroy
        #@article = Article.find(params[:article_id])
        #@comment = @article.comments.find(params[:id])
        #@comment.destroy
        #redirect_to article_path(@article)
    #end
    def destroy
        @article = Article.find(params[:article_id])

        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
