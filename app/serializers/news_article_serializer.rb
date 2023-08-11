class NewsArticleSerializer < ActiveModel::Serializer
  attributes :id, :content, :label, :origin_site
end
