class Article < ApplicationRecord
  validates :title, presence: true
  validates :intro, presence: true
  validates :description, presence: true
  validates :thunbnail, presence: true
end
