# frozen_string_literal: true

class Mypage::NotificationSettingsController < Mypage::BaseController
  def show
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_back(fallback_location: root_path, success: '更新しました')
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(notification_timing_ids: [])
  end
end
