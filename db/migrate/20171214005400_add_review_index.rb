class AddReviewIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :reviews, :user_id
    add_index :reviews, :article_id
  end
end
