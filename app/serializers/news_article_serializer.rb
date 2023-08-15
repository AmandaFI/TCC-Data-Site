class NewsArticleSerializer < ActiveModel::Serializer
  attributes :id, :content, :label
end
