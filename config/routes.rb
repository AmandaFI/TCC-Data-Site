Rails.application.routes.draw do
  namespace :api do
    get 'subject/index'
    get 'subject/show'
    get 'subject/create'
    get 'subject/update'
    get 'subject/destroy'
    get 'news_article/show'
    get 'news_article/create'
    get 'news_article/update'
    get 'news_article/destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
