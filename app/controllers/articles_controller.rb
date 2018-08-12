class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

before_action :check_user, except: [:index, :show]

  def new
    @article = Article.new
  end

  #def create
    #byebug
    #render 'articles/blabla'
    #render plain: params [:article].inspect
    # params - tu dostaniemy caly ladunek, ktory przeslalismy i tu jest tresc artykulu ktory chcemy utworzyc
    # .inspect - pokaze nam w formie debugowej
  # end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
    # redirect_to article_path(article.id) ... cos tu zamienia
  end

  def show
    #byebug
    @article = Article.find(params[:id])
    @comment = @article.comments.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :text, :article_type)
  end

  def check_user
    store_location_for(:user, request.path)
    redirect_to new_user_session_path unless user_signed_in?
  end

end
