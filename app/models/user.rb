class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #与 article 关系
  has_many :articles, dependent: :destroy

  #emails 用户名缩写
  def display_name
    self.email.split("@").first
  end

end
