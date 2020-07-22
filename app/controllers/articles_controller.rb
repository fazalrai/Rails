class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
   
    def new
        @new_article = Article.new
    end
    def sum
        puts "hello world"
    end
    def show
        @temp=Article.find(params[:id])
        puts "print obj found"
        puts @temp
    end
   
    def create  

    
        @new_article=Article.new(article_params)
        if @new_article.save
            redirect_to @new_article
        else
            render 'new'

        end
        

    end
    def index
        @articles = Article.all
    end
    

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
          else
            render 'edit'
          end


    end
    def edit        
        puts "edit called"

        @new_article = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
    end
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
