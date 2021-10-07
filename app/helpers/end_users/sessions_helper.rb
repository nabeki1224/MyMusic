module EndUsers::SessionsHelper
  # 渡されたユーザーでログインする
  # def log_in(end_user)
  #   if end_user.uid
  #     session[:uid] = end_user.uid
  #   else
  #     session[:uid] = end_user.id
  #   end
  # end

  # # 現在ログイン中のユーザーを返す (いる場合)
  # def current_end_user
  #   if session[:uid]
  #     @current_end_user ||= EndUser.find_by(uid: session[:uid])
  #   end
  # end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_end_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:uid)
    @current_end_user = nil
  end
end