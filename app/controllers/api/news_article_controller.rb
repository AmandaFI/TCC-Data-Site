class Api::NewsArticleController < ApplicationController

  before_action :find_news_article, only: [:show, :update, :destroy]

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

  def destroy
    @news_article.destroy
    head :no_content
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
end
