class ArticlesController < ApplicationController
  before_action :authorize, only: [:edit, :update]

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end


  def create
    @article = Article.new(title: params[:article][:title],
                     body: params[:article][:body],
                     user_id: params[:article][:user_id])
    @article.image.attach(params[:article][:image])
      if @article.save
        return redirect_to article_path(@article.id)
      end
    render :new
    end

  private
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :image)
  end
end
