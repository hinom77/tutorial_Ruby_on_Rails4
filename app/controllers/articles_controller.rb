class ArticlesController < ApplicationController

  def index
    @articles = Article.page(params[:page]).per(3)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(create_params)
    if @article.valid?
      @article.save
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  private
    def create_params
      params.require(:article).permit(:name, :title, :text)
    end

end
