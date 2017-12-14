class Admin::ReviewsController < AdminController

  def index
    @article = Article.find(params[:article_id])
    @reviews = @article.reviews.order("created_at DESC")
    @review = Review.new
  end

  def new
    @article = Article.find(params[:article_id])
    @review = Review.new
  end

  def create
    @article = Article.find(params[:article_id])
    @review = Review.new(review_params)
    @review.article = @article
    @review.user = current_user

    if @review.save
      redirect_to admin_article_reviews_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @review = Review.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to admin_article_reviews_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_article_reviews_path(@article)
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end

end
