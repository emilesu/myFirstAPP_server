Rails.application.routes.draw do
  devise_for :users

  # API 路由
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      # article api
      get "/articles" => "articles#index", :as => :articles
      get "/articles/:id" => "articles#show", :as => :article

      # review api
      get "/articles/:article_id/reviews/" => "reviews#index", :as => :reviews
      post "/articles/:article_id/reviews" => "reviews#create", :as => :create_review

      # user 注册/登入/登出 api
      post "/signup" => "auth#signup"
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"

      #user 资料更新 api
      get "/me" => "users#show", :as => :user
      patch "/me" => "users#update", :as => :update_user
    end
  end

  # 后台路由
  namespace :admin do
    resources :articles do
      resources :reviews
    end
  end

end
