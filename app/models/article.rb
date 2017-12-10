class Article < ApplicationRecord

  # 上传主图
  mount_uploader :article_cover, ImageUploader

  validates :title, presence: true
  validates :intro, presence: true
  validates :description, presence: true
  validates :article_cover, presence: true

  # 与 user 关系
  belongs_to :user
end
