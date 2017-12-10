class Api::V1::ArticlesController < ApiController

  def index
    @articles = Article.all.order("created_at DESC")
    render :json => {
      :data => @articles.map{ |article|
        {
          :articleId => article.id,
          :title => article.title,
          :intro => article.intro,
          :article_cover => article.article_cover.thumb,
          :description => article.description,
          :date => article.created_at.to_s(:number),
          :url => api_v1_article_url(article.id)
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
      :article_cover => @article.article_cover.thumb,
      :description => @article.description,
      :date => @article.created_at.to_s(:number),
      :url => api_v1_article_url(@article.id)
    }
  end

end
