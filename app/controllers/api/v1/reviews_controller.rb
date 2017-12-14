class Api::V1::ReviewsController < ApiController

  def index
    @article = Article.find(params[:article_id])
    @reviews = @article.reviews.order("created_at DESC")
    render :json => {
      :data => @reviews.map{ |review|
        {
          :articleId => @article.id,
          :reviewId => review.id,
          :user => review.user.email,
          :content => review.content,
          :date => review.created_at.to_i,
          :url => api_v1_reviews_path(review.id)
        }
      }
    }
  end

  def create
    @article = Article.find(params[:article_id])
    @review = Review.new(
      :article_id => @article.id,
      :user => current_user,
      :content => params[:content]
    )

    if @review.save
      render :json => {
        :articleId => @article.id,
        :userId => @review.user.id,
        :content => @review.content
      }
    else
      render :json => {
        :message => "回复失败", :errors => @review.errors
      }, :status => 400
    end
  end

end
