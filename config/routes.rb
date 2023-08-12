Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do

    resources :news_article, only: [ :create, :show, :update, :destroy ] do
      post :get_random_news_articles, on: :collection
    end
    resources :subject, only: [ :index, :create, :show, :destroy ] do
      post :check_email, on: :collection
    end

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
