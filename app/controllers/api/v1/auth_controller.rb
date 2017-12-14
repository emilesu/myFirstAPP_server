class Api::V1::AuthController < ApiController

  before_action :authenticate_user!, :only => [:logout]

  def signup
    user = User.new(
       :email => params[:email],
       :password => params[:password]
     )

     if user.save
       render :json => {
         :user_id => user.id
       }
     else
       render :json => {
         :message => "Failed",
         :errors => user.errors
       }, :status => 400
     end
  end

  def login
    if params[:email] && params[:password]
      user = User.find_by_email( params[:email] )     #通过post输入, 找到需要验证的账号 email
    end

    if user && user.valid_password?( params[:password] )      #对当前 user 的密码和输入的密码做匹配确认
      render :json => {
        :message => "OK",
        :auth_token => user.authentication_token,
        :user_id => user.id
      }
    else
      render :json => {
        :message => "Email or Password is wrong",
      }, :status => 401
    end
  end

  def logout
    current_user.generate_authentication_token    #重新产生一组新的 token
    current_user.save!

    render :json => {
      :message => "OK"
    }
  end

end
