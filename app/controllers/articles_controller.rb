class ArticlesController < ApplicationController
  before_action :authorize, only: [:edit, :update]

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all.order(created_at: :desc)
  end


  def create
    @article = Article.create! params.require(:article).permit(:title, :user_id, :image, :content)
    @article.image.attach(params[:article][:image])
    # @article.content.attach(params[:article][:content])
      if @article.save
        return redirect_to article_path(@article.id)
      end
    render :new
    end

    def by_month
      date = Date.parse(params[:month])
      @articles = Article.where(created_at: date..date.end_of_month)
    end
    

  private
  def article_params
    params.require(:article).permit(:title, :user_id, :image, :content)
  end
end
