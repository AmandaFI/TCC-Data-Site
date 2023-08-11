class Api::NewsArticleController < ApplicationController

  before_action :find_news_article, only: [:show, :update, :destroy]

  NEWS_ARTICLES_AMOUNT = 20 + 1
  # NEWS_ARTICLES_AMOUNT = 623 + 1


  def show
    render json: @news_article
  end

  def create
    news_article = NewsArticle.new(create_params)
    if news_article.save
      render json: news_article, status: :created
    else
      render json: {errors: news_article.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @news_article.update(update_params)
      render json: @news_article, status: :ok
    else
      render json: {errors: @news_article.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @news_article.destroy
    head :no_content
  end

  def get_random_news_articles
    newsArticlesIds = []
    newsArticlesQuantity = params[:quantity] < NEWS_ARTICLES_AMOUNT - 1 ? params[:quantity] : NEWS_ARTICLES_AMOUNT - 1
    newsArticlesQuantity.times do |i|
      id = rand(1...NEWS_ARTICLES_AMOUNT)
      while newsArticlesIds.include? id
        id = rand(1...NEWS_ARTICLES_AMOUNT)
      end
      newsArticlesIds << id
    end

    newsArticles = NewsArticle.where(id: newsArticlesIds)

    render json: newsArticles, status: :ok

  end

  private

  def find_news_article
    @news_article = NewsArticle.find(params[:id])
  end

  def create_params
    params.permit(:content, :label, :origin_site)
  end

  def update_params
    params.permit(:content, :label, :origin_site)
  end

  def random_articles_params
    params.permit(:quantity)
  end
end
