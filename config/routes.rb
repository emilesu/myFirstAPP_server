Rails.application.routes.draw do
  devise_for :users

  # API 路由
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      get "/articles" => "articles#index", :as => :articles
      get "/articles/:id" => "articles#show", :as => :article
    end
  end

  # 后台路由
  namespace :admin do
    resources :articles
  end

end
