class Api::V1::ReviewsController < ApiController

  before_action :authenticate_user!, :only => [:create]

  def index
    @article = Article.find(params[:article_id])
    @reviews = @article.reviews.order("created_at DESC")
    render :json => {
      :review_count => @reviews.count,
      :data => @reviews.map{ |review|
        {
          :articleId => @article.id,
          :reviewId => review.id,
          :content => review.content,
          :user_name => review.user.display_name,
          :user_avatar => review.user.avatar.thumb,
          :date => review.created_at.to_i,
          # :url => api_v1_reviews_path(@article)
        }
      }
    }
  end

  def create
    @article = Article.find(params[:article_id])
    @review = Review.new(
      :content => params[:content]
    )

    @review.article = @article
    @review.user = current_user

    if @review.save
      render :json => {
        :article_id => @article.id,
        :user_id => @review.user.id,
        :content => @review.content
      }
    else
      render :json => {
        :message => "回复失败",
        :errors => @review.errors
      }, :status => 400
    end
  end

end
