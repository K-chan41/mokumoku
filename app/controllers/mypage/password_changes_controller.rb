# frozen_string_literal: true

class Mypage::PasswordChangesController < Mypage::BaseController
  def show; end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to mypage_password_change_path, success: 'パスワードを変更しました'
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
