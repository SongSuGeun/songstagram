module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  #またユーザーがログインしていればtrue、その他ならfalseを返すメソッドも定義します。
  def logged_in?
    current_user.present?
  end
  
end
