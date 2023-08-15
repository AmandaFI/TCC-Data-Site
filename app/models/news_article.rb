class NewsArticle < ApplicationRecord

  def self.random_articles (quantity)
    NewsArticle.order('RANDOM()').limit(quantity)
  end

end
