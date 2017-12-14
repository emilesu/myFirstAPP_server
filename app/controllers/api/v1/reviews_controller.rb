class Api::V1::ReviewsController < ApiController

  before_action :authenticate_user!, :only => [:create]

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
          :url => api_v1_reviews_path(@article)
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
        :articleId => @article.id,
        :user => @review.user.email,
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
