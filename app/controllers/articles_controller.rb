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
    if @article.save
      # create.html.erbの出力
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(create_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    @articles = Article.page(1).per(3)
    # params[:page]に該当するパラメータの取得方法が不明かつ今回のテーマと逸れるため保留
    # destroyのルーティングに:pageを付加するのが一番早い？
  end

  def search
    @articles = Article.where('title like ?', "%#{params[:keyword]}%").order("created_at DESC").limit(20)
  end

  private
    def create_params
      params.require(:article).permit(:name, :title, :text)
    end

end
