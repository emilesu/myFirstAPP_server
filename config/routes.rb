Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      get "/articles" => "articles#index", :as => :articles
      get "/articles/:article_id" => "article#show", :as => :article
    end
  end
end
