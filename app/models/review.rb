class Review < ApplicationRecord
  validates :content, presence: true

  # 与 user 和 article 关系
  belongs_to :user
  belongs_to :article
end
