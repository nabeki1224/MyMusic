class EndUsers::TwittersController < ApplicationController
  def create

  # twitterAPI
    unless request.env['omniauth.auth'][:uid]
      flash[:danger] = '連携に失敗しました'
      redirect_to root_url
    end
    end_user_data = request.env['omniauth.auth']
    end_user = EndUser.find_by(uid: end_user_data[:uid])
    if end_user
      # log_in end_user
      flash[:success] = 'ログインしました'
      redirect_to root_url
    else
      new_end_user = EndUser.new(
        uid: end_user_data[:uid],
        nickname: end_user_data[:info][:nickname],
        name: end_user_data[:info][:name],
        image: end_user_data[:info][:image],
        # email: end_user_data[:info][:email]
      )
        # binding.pry
      new_end_user.email = "twitter@test"
      new_end_user.password = "aaaaaa"
      if new_end_user.save
        binding.pry
        # log_in new_end_user
        flash[:success] = '会員登録完了'
      else
        flash[:danger] = '予期せぬエラーが発生しました'
      end
      redirect_to root_url
    end
  end

  # DELETE /resource/sign_out
  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end

end
