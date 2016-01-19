class ArticlesController < ApplicationController

  def index
    @articles = Article.page(params[:page]).per(3)
  end

  def show
    @article = Article.find(params[:id])
  end

end
