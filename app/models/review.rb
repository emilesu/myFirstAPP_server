class Review < ApplicationRecord
  validates :content, presence: true

  # 与 user 和 article 关系,  user 为可选项
  belongs_to :user, :optional => true
  belongs_to :article
end
