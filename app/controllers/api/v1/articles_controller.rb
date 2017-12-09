class Api::V1::ArticlesController < ApiController

  def index
    @articles = Articles.all.order("creacted_at DESC")
    render :json => {
      :data => @articles.map{ |article|
        {
          :articleId => article.id,
          :title => article.title,
          :intro => article.intro,
          :thunbnail => article.thunbnail,
          :description => article.description,
          :date => time_ago_in_words(article.creacted_at),
          :url => api_vi_article_url(article.id)
        }
      }
    }
  end

  def show
    @article = Article.find(params[:id])
    render :json => {
      :articleId => @article.id,
      :title => @article.title,
      :intro => @article.intro,
      :thunbnail => @article.thunbnail,
      :description => @article.description,
      :date => time_ago_in_words(@article.creacted_at),
      :url => api_vi_article_url(@article.id)
    }
  end

end
