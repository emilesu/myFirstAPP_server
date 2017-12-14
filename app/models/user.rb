class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #与 article 关系
  has_many :articles, dependent: :destroy

  # 与 review 关系
  has_many :reviews

  #emails 用户名缩写
  def display_name
    self.email.split("@").first
  end

  # 给 user 加上 token
  before_create :generate_authentication_token

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end

  # ---

end
