class RenameThunbnailName < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :thunbnail, :article_cover
  end
end
